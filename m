Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3315C72368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBA9xq7O002886; Wed, 10 Dec 2014 09:59:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jIkyPwsZQs62; Wed, 10 Dec 2014 09:59:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBA9xddf002851
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Dec 2014 09:59:51 GMT
Message-ID: <1418205616.22903.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lars Michael <lh_post@yahoo.com>
Date: Wed, 10 Dec 2014 10:00:16 +0000
In-Reply-To: <1018146195.4734038.1418199056251.JavaMail.yahoo@jws10083.mail.ne1.yahoo.com>
References: <mailman.1581.1418174979.1406.openembedded-core@lists.openembedded.org>
	<1018146195.4734038.1418199056251.JavaMail.yahoo@jws10083.mail.ne1.yahoo.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem building image with opkg and gpg support
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
X-List-Received-Date: Wed, 10 Dec 2014 10:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-12-10 at 08:10 +0000, Lars Michael wrote:
> Hi all,
> 
> 
> I hope this post hits the right list.. 
> 
> 
> On daisy I have switched to opkg, this works fine (target wandboard).
>
> To support signed packages I have added gpg to the PACKAGECONFIG for
> opkg. I have done this by creating an opkg_0.2.1.bbappend file with
> the line: 
> PACKAGECONFIG += "gpg"
>
> In my image recipe I added:
> IMAGE_INSTALL_append = " opkg"
> IMAGE_INSTALL_append = " gpgme"
>
> 'bitbake opkg' seems to run ok and builds libgpgme and opkg ipk's. But
> when I run 'bitbake myimage' I get:
>
> ERROR: Nothing PROVIDES 'gpgme-native' (but
> virtual:native:/media/datadisk/arm/fsl-community-bsp-daisy/sources/poky/meta/recipes-devtools/opkg/opkg_0.2.1.bb DEPENDS on or otherwise requires it). Close matches:
>   gperf-native
>   rpm-native
>   gmp-native
> ERROR: Required build target 'myimage' has no buildable providers.
> Missing or unbuildable dependency chain was: ['myimage',
> 'opkg-native', 'gpgme-native']
>
> Any ideas on what the problem might be?

You've enabled gpg for both the target and native opkg recipes and there
is no gpg-native for opkg-native to work. If you only the target
verison, you could try:

PACKAGECONFIG_append_class-target = " gpg"

otherwise you need to enable a native version of gpgme, probably adding
BBCLASSEXTEND = "native" to the recipe for starters, there may then be
other tweaks needed.

Cheers,

Richard



