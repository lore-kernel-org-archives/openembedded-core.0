Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (vsp-unauthed01.binero.net
	[195.74.38.225])
	by mail.openembedded.org (Postfix) with ESMTP id 4978665C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 09:08:08 +0000 (UTC)
X-Halon-ID: ae84560e-9b03-11e4-8a31-005056917f90
Authorized-sender: petter@technux.se
Received: from [192.168.1.82] (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA;
	Tue, 13 Jan 2015 10:08:03 +0100 (CET)
Message-ID: <54B4E073.6050805@technux.se>
Date: Tue, 13 Jan 2015 10:08:03 +0100
From: =?windows-1252?Q?Petter_Mab=E4cker?= <petter@technux.se>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Christopher Larson <kergoth@gmail.com>
References: <cover.1420899992.git.petter@technux.se>
	<ecf58c259c3b0bf8589a630617a0e284d647ea97.1420899992.git.petter@technux.se>
	<2635313.PoP8bKsGIp@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2635313.PoP8bKsGIp@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] base.bbclass: detect when S has been set incorrectly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jan 2015 09:08:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2015 04:53 PM, Paul Eggleton wrote:
> Hi Petter,
>
> On Saturday 10 January 2015 15:40:10 Petter Mabäcker wrote:
>> Currently base.bbclass is creating S if it's not created by unpacking
>> an archive or fetching a repository. If we avoid creating S we can detect
>> when S hasn't been set correctly, since it will not exist. Then we can tell
>> the user that they should set S to a proper value, instead of just failing
>> with odd errors in later tasks.
>>
>> Besides removing the auto-creation of S this change will introduce a warning
>> if S is set incorrectly. The reason for not display an error and return is
>> due to all external layers that might have recipes that will fail otherwise
>> and that might be a bit to hard to start with. So use a warning until
>> people have had a chance to cleanup affected recipes.
>>
>> [YOCTO #5627]
>>
>> Signed-off-by: Petter Mabäcker <petter@technux.se>
>> ---
>>   meta/classes/base.bbclass | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index de50be1..789af3b 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -113,7 +113,6 @@ python base_do_fetch() {
>>
>>   addtask unpack after do_fetch
>>   do_unpack[dirs] = "${WORKDIR}"
>> -do_unpack[cleandirs] = "${S}/patches"
>>   python base_do_unpack() {
>>       src_uri = (d.getVar('SRC_URI', True) or "").split()
>>       if len(src_uri) == 0:
>> @@ -121,11 +120,21 @@ python base_do_unpack() {
>>
>>       rootdir = d.getVar('WORKDIR', True)
>>
>> +    # Ensure that we cleanup ${S}/patches
>> +    # TODO: Investigate if we can remove
>> +    # the entire ${S} in this case.
>> +    s_dir = d.getVar('S', True)
>> +    p_dir = os.path.join(s_dir, 'patches')
>> +    bb.utils.remove(p_dir, True)
>> +
>>       try:
>>           fetcher = bb.fetch2.Fetch(src_uri, d)
>>           fetcher.unpack(rootdir)
>>       except bb.fetch2.BBFetchException as e:
>>           raise bb.build.FuncFailed(e)
>> +
>> +    if not os.path.exists(s_dir):
>> +        bb.warn("%s ('S') don't exist, you must set 'S' to a proper value"
>> % s_dir) }
>>
>>   def pkgarch_mapping(d):
>> @@ -220,7 +229,7 @@ CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
>>   CLEANBROKEN = "0"
>>
>>   addtask configure after do_patch
>> -do_configure[dirs] = "${S} ${B}"
>> +do_configure[dirs] = "${B}"
>>   do_configure[deptask] = "do_populate_sysroot"
>>   base_do_configure() {
>>   	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
>> @@ -238,7 +247,7 @@ base_do_configure() {
>>   }
>>
>>   addtask compile after do_configure
>> -do_compile[dirs] = "${S} ${B}"
>> +do_compile[dirs] = "${B}"
>>   base_do_compile() {
>>   	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>>   		oe_runmake || die "make failed"
>> @@ -248,7 +257,7 @@ base_do_compile() {
>>   }
>>
>>   addtask install after do_compile
>> -do_install[dirs] = "${D} ${S} ${B}"
>> +do_install[dirs] = "${D} ${B}"
>>   # Remove and re-create ${D} so that is it guaranteed to be empty
>>   do_install[cleandirs] = "${D}"
> This looks reasonable to me; however I'm sure I recall Chris talking about
> some kind of complication with this issue a year or so ago - Chris do you
> remember what that was about?
>
> Cheers,
> Paul
>
Ok, I will wait and see if Chris remembers anything sneaky about this. I 
have run quite some tests without seeing any problems so far. Perhaps it 
was about removing ${S} instead of just ${S}/patches in do_unpack ? 
Because I think there have been some discussions about that in the past. 
I also did some test with that in the scope of 'bug 5627', but it is far 
more complex to do such a chance, a lot of recipes didn't liked that at 
all =/ It seems more correct to really wipe entire ${S} in that case, 
but I guess it have to wait..

BR,
Petter

