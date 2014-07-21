Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 12B4B701C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 08:27:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6L8RcdA028025; Mon, 21 Jul 2014 09:27:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xS_bshXinwY1; Mon, 21 Jul 2014 09:27:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6L8RVNW028019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 21 Jul 2014 09:27:33 +0100
Message-ID: <1405931246.22985.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Mon, 21 Jul 2014 09:27:26 +0100
In-Reply-To: <cover.1405583236.git.Qi.Chen@windriver.com>
References: <cover.1405583236.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 0/2] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Mon, 21 Jul 2014 08:27:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-17 at 15:53 +0800, Chen Qi wrote:
> The following changes since commit 846bc50fde11bbb36c8eb5b2e3ae6bb644c037f3:
> 
>   ltp: use "foreign" automake strictness (2014-07-16 10:27:16 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib ChenQi/shadow-4.2.1
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/shadow-4.2.1
> 
> Chen Qi (2):
>   shadow: upgrade from 4.1.4.3 to 4.2.1
>   oeqa: fix return status in pam.py to match shadow-4.2.1

I think but am not 100% sure this has introduced another regression:

https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/builds/177

The issue is that X doesn't start in oe-core built images. It does work
correctly in poky. The issue is that the /etc/init.d/xserver-nodm script
returns:

root@qemuarm:/etc# /etc/init.d/xserver-nodm start
Starting Xserver
su: applet not found

or to be more specific:

root@qemuarm:/etc# su -l -c '/etc/X11/Xserver&' xuser
su: applet not found


The poky images appear to work since we install bash. If you remove bash
from packagegroup-core-device-devel.bb, the poky images will show the
same error.

I think this is something to do with the none-suid busybox binary not
containing su support, but why su is being called there, I don't know.
su is being provided by shadow in the image. If I make su provided by
busybox the problem also goes away.

Cheers,

Richard





