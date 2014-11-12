Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46A9762252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 11:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sACB5lqO030341; Wed, 12 Nov 2014 11:05:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KIdMaPbBlZyb; Wed, 12 Nov 2014 11:05:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sACB5YNe030335
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Nov 2014 11:05:46 GMT
Message-ID: <1415790370.2820.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Wed, 12 Nov 2014 11:06:10 +0000
In-Reply-To: <4df30acac92f854aa92f221c7663c952da8d9f1f.1415647839.git.pab@pabigot.com>
References: <cover.1415647839.git.pab@pabigot.com>
	<4df30acac92f854aa92f221c7663c952da8d9f1f.1415647839.git.pab@pabigot.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 07/14] qt-mobility: switch to virtual/bluez
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
X-List-Received-Date: Wed, 12 Nov 2014 11:06:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-11-10 at 15:13 -0600, Peter A. Bigot wrote:
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> index ae1769d..61b5281 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -3,7 +3,7 @@ DEPENDS = "gstreamer util-linux"
>  
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
> -PACKAGECONFIG[bluetooth] = ",,bluez4"
> +PACKAGECONFIG[bluetooth] = ",,virtual/bluez"
>  PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
>  
>  LICENSE = "LGPLv2.1"

I think its examples like this where I start to get concerned. I don't
think the problem we're trying to solve here (bluez4 verses bluez5) maps
well to the way virtual/* is meant to work.

virtual/* things are meant to be equivalent, it doesn't matter which
ones the recipe builds against, it works. A compiler or a kernel are
good examples. That isn't the case for v4 verses v5 since some software
works with 4, some with 5 and some with both.

So what do we need to do?

I think this needs a:

PACKAGECONFIG[bluetooth5] = ",,bluez5"

and then we add a bluetooth5 DiSTRO_FEATURE and a:

                    ${@bb.utils.contains('DISTRO_FEATURES',
'bluetooth5', 'bluetooth5', '', d)}"

We could probably use a mechanism to flag two options as conflicting,
e.g. both bluetooth and bluetooth5 in DISTRO_FEATURES or in
PACKAGECONFIG however that is a separate issue.

We'll of course still need VIRTUAL-RUNTIME_bluez but that isn't a new
problem.

Does that approach work for people?

Cheers,

Richard


