Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 64CF665E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 09:53:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s759rBYF024489; Tue, 5 Aug 2014 10:53:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OeReICI4x1eh; Tue,  5 Aug 2014 10:53:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s759r4kt024235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 5 Aug 2014 10:53:06 +0100
Message-ID: <1407232384.6981.75.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Tue, 05 Aug 2014 10:53:04 +0100
In-Reply-To: <da89178aaf28354f57e6b83df496838aebb13ab6.1407227521.git.Chong.Lu@windriver.com>
References: <cover.1407227521.git.Chong.Lu@windriver.com>
	<da89178aaf28354f57e6b83df496838aebb13ab6.1407227521.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] dbus: fix ptest issue
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
X-List-Received-Date: Tue, 05 Aug 2014 09:53:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-08-05 at 16:33 +0800, Chong Lu wrote:
> We use PTEST_ENABLED to decide whether build ptest package, so inherit
> ptest.bbclass in dbus.inc in order to using PTEST_ENABLED variable.
> Remove PACKAGES and ALLOW_EMPTY, since they have been defined in ptest.bbclass.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index d38ba7e..6268103 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -8,10 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>  DEPENDS = "expat virtual/libintl"
>  RDEPENDS_dbus_class-native = ""
>  RDEPENDS_dbus_class-nativesdk = ""
> -PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest', '', d)}"
> -ALLOW_EMPTY_dbus-ptest = "1"


I don't think you've understood what this is doing, its conditionally
building the separate dbus-ptest recipe, if ptest is enabled.

Why is it separate? dbus-ptest needs glib and glib needs dbus. Your
patch doesn't seem to account for any of that.

"fix ptest issue" is far too vague as a summary of this patch too.

Cheers,

Richard


