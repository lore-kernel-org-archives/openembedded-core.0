Return-Path: <Daniel.Klauer@gin.de>
Received: from good-out-30.clustermail.de (good-out-30.clustermail.de
	[212.223.161.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBED7D2FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 09:05:31 +0000 (UTC)
Received: from [10.0.0.16] (helo=frontend.clustermail.de)
	by smtpout-02.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i3GMv-00057U-BT; Thu, 29 Aug 2019 11:05:31 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1i3GMv-0001qi-9Y; Thu, 29 Aug 2019 11:05:25 +0200
Received: from [10.160.138.39] (10.160.138.39) by Win2012-02.gin-domain.local
	(192.168.1.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 29 Aug 2019 11:05:24 +0200
References: <e90a6dec179ce0b8d20b6181b724df5ff6351da4.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Daniel Klauer <daniel.klauer@gin.de>
Message-ID: <a43ec955-3565-0db1-baa5-0f7f268c8a0b@gin.de>
Date: Thu, 29 Aug 2019 11:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e90a6dec179ce0b8d20b6181b724df5ff6351da4.camel@linuxfoundation.org>
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uboot-sign: Refactor do_deploy prefunc to do_deploy_prepend
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
X-List-Received-Date: Thu, 29 Aug 2019 09:05:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

> That commit message isn't correct.
>
> It removes cleandirs for the prefunc at the start of the prefunc and
> cleandirs for the main function at the start of that main function.

Oh ok, so the prefuncs/postfuncs can have their own [cleandirs], that's
interesting.

How about the following (trying to find a good way to explain it):

-----
When inherited by the u-boot recipe (UBOOT_PN), uboot-sign.bbclass adds
a concat_dtb step, which places additional files into ${DEPLOYDIR}
before do_deploy.

The use of prefuncs for this prevents us from adding
  do_deploy[cleandirs] = "${DEPLOYDIR}"
because that would remove the files produced by the prefunc.
(Each of prefuncs/task/postfuncs functions has their own cleandirs, and
each function's cleandirs are removed at the start of that function.)

Thus, it seems good to make concat_dtb a part of do_deploy, such that it
runs after removal of do_deploy's cleandirs. As before, care is taken to
not interfere with the kernel's do_deploy definition, since concat_dtb
was only needed for u-boot.
-----

