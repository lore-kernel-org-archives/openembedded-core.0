Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 769766A59C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 01:50:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r721oBx8028569
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Aug 2013 18:50:11 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 1 Aug 2013 18:50:08 -0700
Message-ID: <51FB104C.8020602@windriver.com>
Date: Fri, 2 Aug 2013 09:50:04 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
	<CAP9ODKrK-qHCVHRfRwatCfp6e2RaejP5CSm+xBgEEp95uSb13g@mail.gmail.com>
In-Reply-To: <CAP9ODKrK-qHCVHRfRwatCfp6e2RaejP5CSm+xBgEEp95uSb13g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 02 Aug 2013 01:50:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2013 12:46 AM, Otavio Salvador wrote:
> On Thu, Aug 1, 2013 at 8:04 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
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
> Cool! :-)
>
>>   scripts/contrib/list-packageconfig-flag.py | 180 +++++++++++++++++++++++++++++
> I'd drop .py extension and use +x permission.
>
Most scripts in scripts/contrib have '.py' or '.sh' extension, is it the 
rule to be followed or not?

It looks like the following 'new file mode 10755' means +x permission is 
used.
>>   1 file changed, 180 insertions(+)
>>   create mode 100755 scripts/contrib/list-packageconfig-flag.py
>>
>> diff --git a/scripts/contrib/list-packageconfig-flag.py b/scripts/contrib/list-packageconfig-flag.py
>> new file mode 100755
>> index 0000000..7a5568f
>> --- /dev/null
>> +++ b/scripts/contrib/list-packageconfig-flag.py
>> @@ -0,0 +1,180 @@
>> +#!/usr/bin/env python
>> +
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program; if not, write to the Free Software Foundation.
>> +#
>> +# Copyright (C) 2013 Wind River Systems, Inc.
>> +#
>> +# list recipes which have PACKAGECONFIG's flags in METADIR
>> +# list PACKAGECONFIG's flags and all affected recipes in METADIR
>> +#
>> +
>> +import sys
>> +import getopt
>> +import os
>> +import re
>> +
>> +usage_body = '''  list recipes which have PACKAGECONFIG's flags in METADIR
>> +
>> +OPTION:
>> +  -h, --help  display this help and exit
>> +  -f, --flag  list PACKAGECONFIG's flags and all affected recipes in METADIR
>> +
>> +EXAMPLE:
>> +list-packageconfig-flag.py poky/meta poky/meta-yocto
>> +list-packageconfig-flag.py -f poky/meta poky/meta-yocto
>> +'''
>> +
>> +def usage():
>> +    print 'Usage: %s [OPTION] [METADIR]...' % os.path.basename(sys.argv[0])
>> +    print usage_body
>> +
>> +def parse_recipe(recipe):
>> +    ''' Parse a recipe to collect PACKAGECONFIG's flags '''
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
>> +
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
> In case a PACKAGECONFIG is add by a class. I think this case is missing here.
Agree, sorry for the missing, I will add it.

Thanks,
Hongxu
>


