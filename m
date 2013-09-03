Return-Path: <zbigniew.halas@citrix.com>
Received: from SMTP.CITRIX.COM (smtp.citrix.com [66.165.176.89])
	by mail.openembedded.org (Postfix) with ESMTP id AA9476BCF6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:22:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,1015,1367971200"; d="scan'208";a="50050732"
Received: from accessns.citrite.net (HELO FTLPEX01CL03.citrite.net)
	([10.9.154.239])
	by FTLPIPO01.CITRIX.COM with ESMTP; 03 Sep 2013 18:22:11 +0000
Received: from norwich.cam.xci-test.com (10.80.248.129) by
	smtprelay.citrix.com (10.13.107.80) with Microsoft SMTP Server id
	14.2.342.4; Tue, 3 Sep 2013 14:22:10 -0400
Received: from luna.cam.xci-test.com ([10.80.248.124])	by
	norwich.cam.xci-test.com with esmtp (Exim 4.72)	(envelope-from
	<zbigniew.halas@citrix.com>)	id 1VGvEw-0002jX-SF	for
	openembedded-core@lists.openembedded.org;
	Tue, 03 Sep 2013 18:22:10 +0000
From: Zbigniew Halas <zbigniew.halas@citrix.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 19:22:10 +0100
Message-ID: <2813997.u0vtaCWRMy@luna.cam.xci-test.com>
User-Agent: KMail/4.10.5 (Linux/3.10.4-100.fc18.x86_64; KDE/4.10.5; x86_64; ; )
MIME-Version: 1.0
X-DLP: MIA2
Subject: Race condition in log_check
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
X-List-Received-Date: Tue, 03 Sep 2013 18:22:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I've just noticed that there is a race condition in log_check after rootfs 
creation. do_rootfs task invokes package type specific shell function - in my 
case it's rootfs_ipk_do_rootfs which in turn invokes log_check on the log file 
produced by do_rootfs (log.do_rootfs.${PID}), which is buffered by BitBake, and 
despite the fact that all packages are already installed when  log_check runs, 
output may not have been flushed yet, so some errors may not be detected.

In my case relevant parts of log.do_rootfs look like that: 
#v+
Collected errors:
 * opkg_conf_load: Could not create lock file [...]
#v-

And a few lines below:
#v+
log_check: Using [...]
Logfile is clean
#v-

and it was consistently passing log_check despite this error being there for a 
long time. I'm using slightly outdated OE, but there haven't been any relevant 
changes since then.

Regards,
Zbigniew


