Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Rk4xj-0008RF-US
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 03:27:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q092KNG6006984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jan 2012 18:20:23 -0800 (PST)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 8 Jan 2012 18:20:22 -0800
Message-ID: <4F0A4EE5.7040906@windriver.com>
Date: Mon, 9 Jan 2012 10:20:21 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1325837822.git.wenzong.fan@windriver.com>
	<b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
	<4F06B4E5.7090901@linux.intel.com>
In-Reply-To: <4F06B4E5.7090901@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] archive.bbclass: archive work directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 02:27:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 04:46 PM, Saul Wold wrote:
> On 01/06/2012 12:20 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Some legal departments believe a complete archive of the work directory
>> is required for certain license compliance issues. We could therefore
>> do with a class which archives up the work directories in each build and
>> provide them so those legal departments can be happy.
>>
>> Implementations:
>>
>> Add a new class named 'archive.bbclass' to provide task 'do_archive',
>> and get it called after 'do_patch' before 'do_configure'.
>>
>> Following cases should be considered to the sources dirs:
>> 1) The sources dir is under $WORKDIR:
>> Just archive sources and temp/run.* up.
>>
>> 2) The sources dir is outside of $WORKDIR, the only package is gcc:
>> Copy its sources and temp/run.* to a temporary dir and then archive
>> them up.
>>
>> 3) The sources dir is equal to $WORKDIR:
>> Just archive whole work dir up.
>>
>> [YOCTO #1590]
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>   meta/classes/archive.bbclass |   42 
>> ++++++++++++++++++++++++++++++++++++++++++
>>   1 files changed, 42 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/classes/archive.bbclass
>>
>> diff --git a/meta/classes/archive.bbclass b/meta/classes/archive.bbclass
>> new file mode 100644
>> index 0000000..75ac090
>> --- /dev/null
>> +++ b/meta/classes/archive.bbclass
>> @@ -0,0 +1,42 @@
>> +# Archive the patched sources and build scripts to assist in license
>> +# compliance by the end user or legal departments.
>> +
>> +ARCHIVE_DIR = "${TMPDIR}/archives/${MULTIMACH_TARGET_SYS}/"
>> +do_archive[dirs] = "${ARCHIVE_DIR}"
>> +
> I see you set ARCHIVE_DIR, but I don' see you move or copy any files 
> to this directory, am I missing something?

It just gets bitbake creating '${ARCHIVE_DIR}' before the task started, 
and then 'do_archive' will be run in this dir.

>
>> +archive_do_archive() {
>> +    # In mostly scenarios the $S is under $WORKDIR and has a separate
>> +    # dir for storing the sources; but gcc is a special case, its 
>> sources
>> +    # had been moved to the shared location 'tmp/work-shared/'
>> +    if [[ -d ${S}&&  ${S} != ${WORKDIR} ]]; then
>> +        if [[ ${S} =~ "/work-shared/gcc" ]]; then
>> +            # Create temporary sources directory for gcc
>> +            mkdir -p ${PF}/temp
>> +            cp -r ${S} ${PF}
>> +            cp -r ${S}/../temp/* ${PF}/temp
>> +            cp -r ${WORKDIR}/temp/* ${PF}/temp
>> +            tarbase=`pwd`
>> +        else
>> +            tarbase=`dirname ${WORKDIR}`
>> +        fi
>> +
>> +        sourcedir=`basename ${S}`
>> +        tar -C $tarbase -cjf ${PF}.tar.bz2 ${PF}/$sourcedir \
>> +            ${PF}/temp --exclude log.do_*
>> +
> Also, do you want to name the tarball PF or BP, which deals with 
> removing any multilib naming issues if the build it multilib.
>
> Note BP = ${BPN}-${PV} so it removes the ${PR} if that is important 
> (which it might be).

Sorry I'm not clear your exact meanings here, do you mean the tarball 
name with '${PF}' will have any issues?

Thanks
Wenzong

>
>> +        # Remove the temporary gcc sources directory
>> +        if [[ ${S} =~ "/work-shared/gcc"&&  -d ${PF} ]]; then
>> +            rm -rf ${PF}
>> +        fi
>> +    fi
>> +
>> +    # Just archive whole build directory up when $S is equal to 
>> $WORKDIR
>> +    if [[ -d ${S}&&  ${S} == ${WORKDIR} ]]; then
>> +        tarbase=`dirname ${WORKDIR}`
>> +        tar -C $tarbase -cjf ${PF}.tar.bz2 ${PF} --exclude log.do_*
>> +    fi
>> +}
>> +
>> +addtask do_archive after do_patch before do_configure
>> +
>> +EXPORT_FUNCTIONS do_archive
>



