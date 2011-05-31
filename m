Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRJu5-0007UD-2L for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 10:02:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4V7x5YN010688
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 08:59:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10539-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 08:59:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4V7wx9s010680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 08:58:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=MccvuwcbiMPDPmAw+ac15LHJQZg@mail.gmail.com>
References: <BANLkTi=MccvuwcbiMPDPmAw+ac15LHJQZg@mail.gmail.com>
Date: Tue, 31 May 2011 08:58:44 +0100
Message-ID: <1306828724.27470.337.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Chicken toolchain progress
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 08:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 01:51 +0000, Otavio Salvador wrote:
> Hello,
> 
> Here at O.S. Systems we use Chicken (Scheme) a lot and we deliver it
> on our embedded OS ofthenly. Since we're moving to oe-core we're
> working at migrating it to it and we then decided to include it as a
> meta-oe layer for later proposal for merging.
> 
> Currently we got most of it done but the cross compiler is failing.
> 
> Our recipe can be seen at
> https://github.com/OSSystems/meta-oe/commit/3d29a0ca35e29cc9629a7628dfe19734bc28b229#diff-0
> 
> It seems to build fine but sstate and sysroot lacks the binaries so we
> can't use it to build the target binaries.
> 
> Any clue?

It sounds like something in your paths are messed up in chicken-cross.
What is happening during do_install? Where are the files ending up? What
paths do they have?

+EXTRA_OEMAKE += " \
+    PROGRAM_PREFIX=${TARGET_PREFIX} \
+    TARGET_PREFIX=${STAGING_DIR_TARGET} \

This looks a little odd...

My guess is that things end up in the wrong place during do_install and
the system therefore fails to pick them up. The binaries should be in
${D}${bindir} for example.

Cheers,

Richard





