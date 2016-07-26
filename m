Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3A7606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 07:36:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6Q7aDld024500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 00:36:14 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 00:36:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2016 15:33:17 +0800
Message-ID: <1469518399-22052-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] busybox: fix for syslog service in systemd
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
X-List-Received-Date: Tue, 26 Jul 2016 07:36:16 -0000
Content-Type: text/plain

commit 9943ffeeed5c612d1bc44a12607d553f7704dc7e
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Thu Sep 11 04:55:35 2014 -0400

    busybox: fix for syslog service in systemd
    
    This patch includes the following changes:
    1. Explicitly set StandardOutput of the log daemon to null.
       This would avoid creating a feedback loop of the syslog service.
       See link below for more information.
       http://www.freedesktop.org/wiki/Software/systemd/syslog/
    
    2. Use ALTERNATIVE machanism to manage the syslog service file.
       This is because that other package may also provide a syslog
       implementation.
    
    3. Make the syslog daemon socket activated only. Otherwise, things
       would crash if we install busybox-syslog and other syslog packages
       together in one image.
    
    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

commit 425d7b8605612cdc65daf2c1ef6cf5655ad8f227
Author: Yadi.hu <yadi.hu@windriver.com>
Date:   Wed Jun 1 17:54:17 2016 -0700

    busybox: handle syslog
    
    If CONFIG_KLOGD is not enabled, then the related service file should
    not be installed, The error message is below:
    
        Cannot add dependency job for unit busybox-klogd.service,
        ignoring: Unit busybox-klogd.service failed to load:
        No such file or directory.
    
    So we should first check the configuration before we install these
    service files.
    
    Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
    Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

