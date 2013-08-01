Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 556EA61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:46:17 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id tb18so4374287obb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HYSKVyXhvSnYRbzFh72l5cBlLqJ1s8WQaQnukCUiMJg=;
	b=Le9k7SKXYC0QIPHdu3gts1MTWLOYGuUvPwqiGJOVDzdHk8rHao5OLx5JmO8z47Wvtg
	bDNVmTEsk4Ozb0+vK5+cdcDLUm8fwFqWPZMaPGDaIGFhp4Qlhz49mj6xjcZaZZpwh/xa
	Nmi8SWPpUvbZZSIoc0zybJUaUIcQGVu83wH9e/J3LHG6oql8ezP1q52UgTQItIWHyvC8
	olDoEP7OV7Oo+palfyA7585ng4Be/qm3gAcgrXfUbQ5z4wXB5tIF0dwOVbDKBV23Omk2
	3o4BmvjXDsqtC71MzpnqtOyJ1rdyO1zMIUV2CmIaDmAiIasdCWDIzhGHPgyj2DVtgNrq
	Q5oQ==
MIME-Version: 1.0
X-Received: by 10.60.79.3 with SMTP id f3mr1958421oex.50.1375375577701; Thu,
	01 Aug 2013 09:46:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 1 Aug 2013 09:46:17 -0700 (PDT)
In-Reply-To: <2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
Date: Thu, 1 Aug 2013 13:46:17 -0300
X-Google-Sender-Auth: UPJ7IWBZhZKGU2ls4Vi3x1nno7M
Message-ID: <CAP9ODKrK-qHCVHRfRwatCfp6e2RaejP5CSm+xBgEEp95uSb13g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 01 Aug 2013 16:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 8:04 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> list-packageconfig-flag.py will walk the METADIR and collect recipes which
> have PACKAGECONFIG's flags.
>
> The default display is to list recipes which have PACKAGECONFIG's flags in
> METADIR. If option '-f' is used, it will list PACKAGECONFIG's flags and all
> affected recipes in METADIR
>
> EXAMPLE:
> list-packageconfig-flag.py poky/meta poky/meta-yocto
> RECIPE NAME          PACKAGECONFIG's flag
> =========================================
> libarchive_2.8.5.bb  acl xattr largefile zlib bz2 xz openssl libxml2 expat
> strace_4.8.bb        libaio acl
> connman.inc          wifi bluetooth 3g tist openvpn vpnc l2tp pptp wispr
>
> list-packageconfig-flag.py -f poky/meta poky/meta-yocto
> PACKAGECONFIG's flag     RECIPE NAME
> ====================================
> speex                    gstreamer1.0-plugins-good.inc
> keyutils                 rpm_5.4.9.bb
> gallium-egl              mesa.inc
>
> [YOCTO #4368]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Cool! :-)

>  scripts/contrib/list-packageconfig-flag.py | 180 +++++++++++++++++++++++++++++

I'd drop .py extension and use +x permission.

>  1 file changed, 180 insertions(+)
>  create mode 100755 scripts/contrib/list-packageconfig-flag.py
>
> diff --git a/scripts/contrib/list-packageconfig-flag.py b/scripts/contrib/list-packageconfig-flag.py
> new file mode 100755
> index 0000000..7a5568f
> --- /dev/null
> +++ b/scripts/contrib/list-packageconfig-flag.py
> @@ -0,0 +1,180 @@
> +#!/usr/bin/env python
> +
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software Foundation.
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#
> +# list recipes which have PACKAGECONFIG's flags in METADIR
> +# list PACKAGECONFIG's flags and all affected recipes in METADIR
> +#
> +
> +import sys
> +import getopt
> +import os
> +import re
> +
> +usage_body = '''  list recipes which have PACKAGECONFIG's flags in METADIR
> +
> +OPTION:
> +  -h, --help  display this help and exit
> +  -f, --flag  list PACKAGECONFIG's flags and all affected recipes in METADIR
> +
> +EXAMPLE:
> +list-packageconfig-flag.py poky/meta poky/meta-yocto
> +list-packageconfig-flag.py -f poky/meta poky/meta-yocto
> +'''
> +
> +def usage():
> +    print 'Usage: %s [OPTION] [METADIR]...' % os.path.basename(sys.argv[0])
> +    print usage_body
> +
> +def parse_recipe(recipe):
> +    ''' Parse a recipe to collect PACKAGECONFIG's flags '''
> +    prog = re.compile(r' *PACKAGECONFIG\[(?P<flag>.*)\] *=.*')
> +    try:
> +        r = open(recipe)
> +    except IOError as (errno, strerror):
> +        print >> sys.stderr, 'WARNING: Failed to open recipe', recipe
> +
> +    flaglist = []
> +    for line in r:
> +        # Strip any comments from the line
> +        line = line.rsplit('#')[0]
> +        m = prog.match(line)
> +        if m:
> +            flaglist.append(m.group('flag'))
> +    r.close()
> +
> +    return flaglist
> +
> +def process_recipes(metadir):
> +    ''' Collect recipes which have PACKAGECONFIG's flags in METADIR '''
> +    # recipesdict = {'recipe': ['flag1', 'flag2',...]}
> +    recipesdict = {}
> +    for root,dirs,files in os.walk(metadir):
> +        for name in files:
> +            if name.find(".bb") >= 0 or name.find(".inc") >= 0:
> +                flaglist = parse_recipe(os.path.join(root,name))
> +                if flaglist:
> +                    recipesdict[name] = flaglist
> +
> +    return recipesdict

In case a PACKAGECONFIG is add by a class. I think this case is missing here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

