Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E07466066A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 09:14:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r729Ef3K004690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Aug 2013 02:14:41 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 2 Aug 2013 02:14:38 -0700
Message-ID: <51FB787A.2040406@windriver.com>
Date: Fri, 2 Aug 2013 17:14:34 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
	<2353783.439DWQmp63@helios>
In-Reply-To: <2353783.439DWQmp63@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Fri, 02 Aug 2013 09:14:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2013 04:24 PM, Paul Eggleton wrote:
> Hi Hongxu,
>
> Great idea! This should be very useful indeed.
>
> Just a few feedback points:
>
> On Thursday 01 August 2013 19:04:05 Hongxu Jia wrote:
>> list-packageconfig-flag.py will walk the METADIR and collect recipes which
>> have PACKAGECONFIG's flags.
>>
>> The default display is to list recipes which have PACKAGECONFIG's flags in
>> METADIR. If option '-f' is used, it will list PACKAGECONFIG's flags and all
>> affected recipes in METADIR
>>
>> EXAMPLE:
>> list-packageconfig-flag.py poky/meta poky/meta-yocto
>> RECIPE NAME          PACKAGECONFIG's flag
>> =========================================
>> libarchive_2.8.5.bb  acl xattr largefile zlib bz2 xz openssl libxml2 expat
>> strace_4.8.bb        libaio acl
>> connman.inc          wifi bluetooth 3g tist openvpn vpnc l2tp pptp wispr
>>
>> list-packageconfig-flag.py -f poky/meta poky/meta-yocto
>> PACKAGECONFIG's flag     RECIPE NAME
>> ====================================
>> speex                    gstreamer1.0-plugins-good.inc
>> keyutils                 rpm_5.4.9.bb
>> gallium-egl              mesa.inc
>>
>> [YOCTO #4368]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   scripts/contrib/list-packageconfig-flag.py | 180
>> +++++++++++++++++++++++++++++ 1 file changed, 180 insertions(+)
>>   create mode 100755 scripts/contrib/list-packageconfig-flag.py
> I think the script ought to be called "list-packageconfig-flags" rather than
> "list-packageconfig-flag".
>
Agree, I will rename it.
>> ...
>> +def parse_recipe(recipe):
>> +    ''' Parse a recipe to collect PACKAGECONFIG's flags '''
> This should say "collect available PACKAGECONFIG flags". The same applies to
> other messages/comments.
>
Agree
>> +    prog = re.compile(r' *PACKAGECONFIG\[(?P<flag>.*)\] *=.*')
>> +    try:
>> +        r = open(recipe)
>> +    except IOError as (errno, strerror):
>> +        print >> sys.stderr, 'WARNING: Failed to open recipe', recipe
>> +
>> +    flaglist = []
>> +    for line in r:
>> +        # Strip any comments from the line
>> +        line = line.rsplit('#')[0]
>> +        m = prog.match(line)
>> +        if m:
>> +            flaglist.append(m.group('flag'))
>> +    r.close()
>> +
>> +    return flaglist
>>
>> +def process_recipes(metadir):
>> +    ''' Collect recipes which have PACKAGECONFIG's flags in METADIR '''
>> +    # recipesdict = {'recipe': ['flag1', 'flag2',...]}
>> +    recipesdict = {}
>> +    for root,dirs,files in os.walk(metadir):
>> +        for name in files:
>> +            if name.find(".bb") >= 0 or name.find(".inc") >= 0:
>> +                flaglist = parse_recipe(os.path.join(root,name))
>> +                if flaglist:
>> +                    recipesdict[name] = flaglist
>> +
>> +    return recipesdict
> So, this is fairly simple and works for most cases; however it would probably
> be a bit more robust if the script used bitbake's own parser to extract the
> flags. The "tinfoil" module should help with this. We can always address this
> in a follow-up patch later on, though - I can certainly show you some examples
> of how to do this or I can do it, whichever you prefer.
Great, this is what I hope to do in the follow-up, I am very pleased to
do the investigate on bitbake parser, very thankful to share some
examples of how to do this with me.

Should this simple patch be accepted? And I will include bitbake parser
in follow-up patch.
Or
Drop this patch and waiting till bitbake parser has been included.

Thanks,
Hongxu
> Cheers,
> Paul
>


