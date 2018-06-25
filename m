Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7C6B71A9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 18:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 00E22184ED;
	Mon, 25 Jun 2018 20:43:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id QiPgyVleoIAp; Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4D1E3184D7;
	Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6DF1E075;
	Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ED7B1E054;
	Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 229251F7F;
	Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 13CC59C0AD; Mon, 25 Jun 2018 20:43:10 +0200 (CEST)
Date: Mon, 25 Jun 2018 20:43:10 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20180625184309.jctftt6owwq3res6@axis.com>
Mail-Followup-To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Jun 2018 18:43:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-06-25 15:25 +0200, Alexander Kanavin wrote:
> It's better to clean them up in meta/lib/oe/rootfs.py, instead of
> forever carrying a custom patch to rpm.

I have the same hesitations, but we don't know the filenames to
clean up. We can't remove every /var/tmp/rpm-tmp.*, since they
can be created by unrelated rpm executions.

This suggests some (probably[*]) larger, upstreamable work done
in rpm itself, to be able to configure that behavior. I think
this is better than nothing, for now. Perhaps the bug report
shouldn't be closed, and this be merged as a workaround? (It
causes real issues, at least for images with lots of
pre/postinstalls.)

Does anybody see value in what --rpmverbosity=debug brings, as
opposed to the default level of info? Would dropping that from
lib/oe/package_manager.py's RpmPM._invoke_dnf be a better
solution, or workaround?

(Or maybe this is a bug in dnf? At least, this side effect is not
clearly documented, from what I can tell :))

-- 
olofjn

*) i'm not a c developer, so at least for me. :(

