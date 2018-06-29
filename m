Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC8C74501
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 23:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5A316186F0;
	Sat, 30 Jun 2018 01:53:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id p4G2ZkLskpEN; Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id CD85818446;
	Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AED391A063;
	Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2D501A061;
	Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 947082239;
	Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 623739C0AD; Sat, 30 Jun 2018 01:53:46 +0200 (CEST)
Date: Sat, 30 Jun 2018 01:53:46 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20180629235346.qsg3sjhpsaqqqcxi@axis.com>
Mail-Followup-To: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
	<CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Fri, 29 Jun 2018 23:53:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-06-26 12:33 +0200, Alexander Kanavin wrote:
> I believe the culprit is likely this patch:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> 
> As scriptlets are executed outside of rpm's chroot, they are being
> written into system's /var/tmp, not rootfs's. This patch should
> probably be amended to prepend the rootfs path when scriptlets are
> written out, and then we should be sorted.

Is that not a more invasive change than just removing the tmp
files unconditionally (especially in terms of maintainability)?
I'm not even sure how exactly to do that, but I'm obviously
missing something. For instance, is there a way to manipulate the
global rpmMacroContext temporarily?

But your theory seems to be right, no /var/tmp/rpm-tmp.* files
are created if i drop the patch (but some scripts fail, as
expected).

-- 
olofjn

