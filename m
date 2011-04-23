Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QDe9t-0005CW-Pg
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 16:50:05 +0200
Received: by wye20 with SMTP id 20so982996wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Apr 2011 07:47:38 -0700 (PDT)
Received: by 10.227.59.134 with SMTP id l6mr2135181wbh.34.1303570057726;
	Sat, 23 Apr 2011 07:47:37 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u9sm2299765wbg.0.2011.04.23.07.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Apr 2011 07:47:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 23 Apr 2011 16:47:34 +0200
Message-Id: <73DFD7AC-9837-4C27-BB34-2B2AC7D1DD8B@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Bruce Ashfield <Bruce.Ashfield@windriver.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [RFC] don't run make clean on kernel_do_install
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
X-List-Received-Date: Sat, 23 Apr 2011 14:50:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Over the holidays I was trying to build some externel kernel modules and =
they failed to build because linux/bounds.h wasn't in sysroots.

I did this quick hack to work around it:

--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -159,7 +159,8 @@ kernel_do_install() {
        # we clean the scripts dir while leaving the generated config
        # and include files.
        #
-       oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
clean
+       find $kerneldir -name "*.o" -delete
+       #oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
clean
        make -C $kerneldir _mrproper_scripts
        find $kerneldir -path $kerneldir/scripts -prune -o -name =
"*.[csS]" -exec rm '{}' \;
        find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;

I'm not convinced that the above is the right way to solve it, but I =
lack the required kbuild knowledge to come up with a better one. Does =
anyone have a hint on how to approach this problem in a better way?

regards,

Koen=


