Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 193EB79CE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 21:37:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9KLbDbV030328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 20 Oct 2018 22:37:15 +0100
Message-ID: <2980ba34e7eb66ad6ad22d5cd85b12a9bb7e30b2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2018 22:37:11 +0100
In-Reply-To: <aa81e6d3c24822a91432cac5af20378a65301254.1539926193.git.Qi.Chen@windriver.com>
References: <cover.1539926193.git.Qi.Chen@windriver.com>
	<aa81e6d3c24822a91432cac5af20378a65301254.1539926193.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Sat, 20 Oct 2018 21:37:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-19 at 13:19 +0800, Chen Qi wrote:
> Add back alternatives for init utilities to avoid regression.
> 
> These alternatives were removed when upgradeing systemd to 239.
> They were removed out of the logic that init utitilies should be
> bound to init manager. However, it turned out that two use cases
> were not covered.
> 
> 1) initramfs using commands like 'reboot' from busybox.
> 2) Users use customized busybox defconfig which enables init
> utilities.
> 
> The first use case caused a regression bug in yocto.
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914
> Patches were sent to fix the reboot problem.
> 
> But this is not enough. As we may have the second use case. In such
> situation, users will find themselves having regression error when
> using 'busybox + systemd' (and busybox is installed after systemd,
> overriding the systemd symlinks).
> 
> So in order to avoid regression, add back these alternatives.
> 
> Signed-off-by

There is something odd going on which this change since it triggers:

https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/95/steps/7/logs/step7c

I've isolated it to this change having initially thought it was Mark's
systemd change...

Cheers,

Richard


