Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3202C6072C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 14:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 4B3131EE07DA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 16:15:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024) with ESMTP id AQFL50sH0Ww2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 16:15:13 +0200 (CEST)
Received: from [10.1.75.173] (gre92-5-82-237-199-7.fbx.proxad.net
	[82.237.199.7])
	by idris.smile.fr (Postfix) with ESMTPSA id 2C2881EE03E0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 16:15:13 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<1475247756-32008-1-git-send-email-ed.bartosh@linux.intel.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <a1d1262b-1ecf-933a-f3b6-01234c95c31e@smile.fr>
Date: Sun, 2 Oct 2016 16:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475247756-32008-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Sun, 02 Oct 2016 14:15:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

"native" might be a bit too generic...

could I suggest oe_native-run or bitbake-native ?

something that says it's yocto-galaxy specific and can be autocompleted 
with a reasonable prefix...


Jérémy Rosen


On 30/09/2016 17:02, Ed Bartosh wrote:
> Added 'native' convenience shell script to run native tools.
> Example of usage:
>    > bitbake bmap-tools-native
>    > native bmaptool --version
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>   scripts/native | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100755 scripts/native
>
> diff --git a/scripts/native b/scripts/native
> new file mode 100755
> index 0000000..496e34f
> --- /dev/null
> +++ b/scripts/native
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +#
> +# Copyright (c) 2016,  Intel Corporation.
> +# All Rights Reserved
> +#
> +# This program is free software;  you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY;  without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> +# the GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program;  if not, see <http://www.gnu.org/licenses/>
> +#
> +
> +#
> +# This script is for running tools from native oe sysroot
> +#
> +
> +if [ $# -lt 1 -o "$1" = '--help' -o "$1" = '-h' ] ; then
> +    echo "Usage: $0 <native tool> [parameters]"
> +    exit 1
> +fi
> +
> +SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
> +if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
> +        echo "Error: Unable to find oe-find-native-sysroot script"
> +        exit 1
> +fi
> +. $SYSROOT_SETUP_SCRIPT
> +
> +OLDPATH=$PATH
> +
> +# look for a tool only in native sysroot
> +PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
> +tool=`/usr/bin/which $1 2>/dev/null`
> +
> +if [ -n "$tool" ] ; then
> +    # add old path to allow usage of host tools
> +    PATH=$PATH:$OLD_PATH $@
> +else
> +    echo "Error: Unable to find '$1' in native sysroot"
> +    exit 1
> +fi


