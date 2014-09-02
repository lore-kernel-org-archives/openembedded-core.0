Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EFF0712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsPvr010819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:25 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:54:01 +0800
Message-ID: <9539c3b2b0893342f972ef9b9df837f0263d28f0.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/26] rpcbind: avoid entering failed status after stopping daemon
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:25 -0000
Content-Type: text/plain

Exiting with '2' is actually expected with rpcbind, because it catches
SIGTERM and exits with '2' explicitly.

The related code is as follows.

(void) signal(SIGTERM, terminate);

/*
 * Catch the signal and die
 */
static void
terminate(int dummy /*__unused*/)
{
        close(rpcbindlockfd);
        unlink(_PATH_RPCBINDSOCK);
        unlink(RPCBINDDLOCK);
        syslog(LOG_ERR,
                "rpcbind terminating on signal. Restart with \"rpcbind -w\"");
        write_warmstart(); /* Dump yourself */
        exit(2);
}

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
index 4de28d4..33ee268 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -9,6 +9,7 @@ Type=forking
 EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
 ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
 Restart=always
+SuccessExitStatus=2
 
 [Install]
 WantedBy=multi-user.target
-- 
1.9.1


