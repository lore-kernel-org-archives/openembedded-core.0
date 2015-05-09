Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60E1573CDC;
	Sat,  9 May 2015 08:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t498aH9s019255; Sat, 9 May 2015 09:36:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 38CK0b9ELNxO; Sat,  9 May 2015 09:36:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t498a1Y6019250
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 9 May 2015 09:36:13 +0100
Message-ID: <1431160561.8074.345.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Sat, 09 May 2015 09:36:01 +0100
In-Reply-To: <20150508210907.GK5885@denix.org>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de> <20150506233137.GH5885@denix.org>
	<20150508192852.GJ5885@denix.org> <20150508210907.GK5885@denix.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Sat, 09 May 2015 08:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-08 at 17:09 -0400, Denys Dmytriyenko wrote:
> weston-init RDEPENDS on weston and kbd.
> 
> $ bitbake-diffsigs 1.0-r0.do_package_write_ipk.sigdata.eb3921bfc9623056f7ffaef4be8549ab 1.0-r0.do_package_write_ipk.sigdata.90c2978497847912cd64f66039927f7d 
> Hash for dependent task waylandweston_1.6.0.bb.do_packagedata changed from 551b3b5ac7b3c41bfced58b88db2d824 to f3eb9cd1861c186382e47f90e82e3295
> Hash for dependent task kbdkbd_2.0.1.bb.do_packagedata changed from 53a5dc88b80dc5ab559fbecd14277650 to 950fbc7fe3c33564e781743f2c260670
> 
> Then, comparing signatures for weston, for exaple, gives all the changes 
> caused by different DEFAULTTUNEs, TUNE_FEATURES and ARMPKGARCH - obviously, 
> since one machine is cortexa8, while another is cortexa9.
> 
> But why would an allarch package even care about machine tunes in dependant 
> packages, when it only RDEPENDS on them?

If A DEPENDS on B and B changes, the package name may change (thanks to
debian.bbclass) so A has to repackage. Very very annoying but
technically correct :/.

> And how should I fix this? Thanks.

See SIGGEN_EXCLUDERECIPES_ABISAFE in layer.conf of OE-Core. You probably
need to add weston-init to the list.

Cheers,

Richard



