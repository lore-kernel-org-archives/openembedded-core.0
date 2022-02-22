Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BAAC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:17:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.115])
 by mx.groups.io with SMTP id smtpd.web10.1053.1645553824392008103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=KsQWXrfq;
 spf=pass (domain: arri.de, ip: 40.107.1.115, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVZdrkYxkemlOD+N6teXwAcFwwfk4F8zpSBYeKgX+vE5y/wXSamvSGyzXRNvPpE/P4j42avAAItDALh7sfjLFCs1vX7f3p1LZ5WyshDtTPb9QXSt16Yyohewb6cR7sqXQvOIkj+jA/Tgb9Eeft/WA6Fke22MNR7Axh30ZnqoVPe9eQly6YRvCGk2Ps5uSIwBFqxr4ymicvSd+UBEC0xzjOpKViVNWNOh8G+O1NiuViSYOZgsKAkIqxcp2AiFmznrqQgh/2oHYfA7Zm7ltgkfMzJ1PTxjykrOIUU0vOc8QG1Eo4G0jf/FjnVPbJttB8KMEkq3bNQHiuh1QWDnlprLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjYozfHk5wE057GKdb8JXtM9DpIEK6BHB7akmr9tBR4=;
 b=kwL7pomJITX2LlckueBo4BHH3wb4KVAawdx81rFT/beJUIh1SFw5UC6+cDM6F32+93Ua8a/eOZucvr3x7S+FAwBwdZ7aXDtRSbNxIccDo63Fu0CoxqKzt7cgPSVCWpn7kNooF8riQ/PaU40I1+LIMJ2ZoNDqaUbCO9wovKxpNG6RoThRgXVme1+8/enWpndwhoiVYKEzG8yRSNOzOpWBLu+St0V9V4GCKwahEW7CeRp4MEiBBd2vx53xhUvev/kvggReSPopFfIexcTLlcuVZuhhnbi9vIhMcu/tBGtW0+NsuFdbFS+NBJDYBtYuf0OWbnjLoEIRHyS1SzxukTTEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjYozfHk5wE057GKdb8JXtM9DpIEK6BHB7akmr9tBR4=;
 b=KsQWXrfqHqpGWbjoCqc3sJ7e3QAZB+pllmCcHkHNhztutBL0TjTxlhB6k9itLUBxmhf2p29rqG9ywTDSR+HyiIdZ6araAb7hl78GJtCSwyX5WnVzeQ0GgwKEg4W3Ky3PmRdtWShPiNHGblhaarQa798E40qQCYHHPEaRSnGmXRo=
Received: from AM4PR0902CA0017.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::27) by GV1PR07MB8350.eurprd07.prod.outlook.com
 (2603:10a6:150:1d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.7; Tue, 22 Feb
 2022 18:16:59 +0000
Received: from VE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:200:9b:cafe::ff) by AM4PR0902CA0017.outlook.office365.com
 (2603:10a6:200:9b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 18:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT057.mail.protection.outlook.com (10.152.13.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 18:16:58 +0000
Received: from localhost.localdomain (192.168.54.94) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 22 Feb
 2022 19:16:58 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>, Pavel Zhukov
	<pavel@zhukoff.net>
CC: <pavel@zhukoff.net>, Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: Re: [PATCH v3] patch.py: Prevent git repo reinitialization
Date: Tue, 22 Feb 2022 19:16:57 +0100
Message-ID: <2132169.NgBsaNRSFp@localhost.localdomain>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20220221191728.445-1-pavel@zhukoff.net>
References: <20220221191728.445-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [192.168.54.94]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87054e04-d8b1-4388-a1cd-08d9f62f83f4
X-MS-TrafficTypeDiagnostic: GV1PR07MB8350:EE_
X-Microsoft-Antispam-PRVS: 
	<GV1PR07MB835085C6C713CFF2E9B64733BF3B9@GV1PR07MB8350.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kuJUU/Pm6nDJK2DRGTiH9lSYvGAmQsRaFCF+vHZHs+ITxHgh2bF5Wz+9PvjgL8NLmZdz+vj2NzBPraalejErjutdg7yehkNKOJLyNENFBd2bSj5Z0fZvi1EdxfExG0yog3zkLbEHSuS7QjaSfVPcwYiaVtnshYKzPZaw15/8kL5R1/jEVrfwa44uXzXXURPzxd5K/WRL1tox+a4MT6Y5bFv9CBdmI2yJBpJbtQAH1ZImEKGX/ybnlyQU39rFBGoVHAt7XcrXRjIZAI5ZOK9d0tezKEve9BYpUJ8ZqW8jpeCq4q2+NWmJj03Cc8Se9f8JaiKEqC9rYgWdDY+t+/w6bj3PGWQ33AfbBg8JJ3/9KoppFuzyKsKHtEgI8dtBBqykj29IAV1cLuH5QLRGExn1u1wGISgZzkzupR5sQlF3nVh8n+vDd+1xGawt9K5Rn+5dBX1jqredWRmH9wbTmPKtyVCjVPLHCqKG8u2X4AJmEROo0AEFSv2eAer6DL2AbeWt+ks8vmpF5OUATWfZRZHp3gk3NqtkN1v1mimXoILPJAKouUaSp4UNBJmeuijXdIMDDaAt7Fv/yDBhg6Hnm7YfrTYMou3FNudHHYysXekAodKWvc/VRcaBblu4pMzkN/Fdgpd46TMaBRptS4qt82ym/AG39MJ2iGPRFrLewQyBsO8MBPtnD0JHVZzko9uREyngHa9FpNLupxKIgulxOhKfE4aOtyzyYHfco91EJk7xtKSqLLspBhNt+FPXDSivR6xvmTClIgol0cULryU2KmgXPg==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2906002)(8676002)(86362001)(70586007)(81166007)(4326008)(8936002)(356005)(5660300002)(82310400004)(70206006)(55016003)(36860700001)(426003)(508600001)(16526019)(336012)(26005)(36916002)(9686003)(7696005)(83380400001)(110136005)(54906003)(316002)(186003)(47076005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:16:58.6754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87054e04-d8b1-4388-a1cd-08d9f62f83f4
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT057.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162184

On Monday, 21 February 2022, 20:17:29 CET, Pavel Zhukov wrote:
> There were few bugs in the _isInitialized() function which might trigger
> git repo to be reinitialized and patches failing to apply.
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../recipes-test/gitrepotest/gitrepotest.bb   | 16 ++++++++++++++++
>  .../gitrepotest/0001-testpatch.patch          |  9 +++++++++
>  meta/lib/oe/patch.py                          | 11 ++++++++---
>  meta/lib/oeqa/selftest/cases/bbtests.py       | 19 +++++++++++++++++--
>  4 files changed, 50 insertions(+), 5 deletions(-)
>  create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
>  create mode 100644 meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
> 
> diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> new file mode 100644
> index 0000000000..f1b6c55833
> --- /dev/null
> +++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Test recipe for git repo initialization"
> +HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +PATCHTOOL="git"
> +
> +SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https \
> +           file://0001-testpatch.patch \
> +          "
> +
> +SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
> +
> +S = "${WORKDIR}/git"
> diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
> new file mode 100644
> index 0000000000..bccda17ee9
> --- /dev/null
> +++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
> @@ -0,0 +1,9 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index 432a9b4..bbf7c74 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,3 +1,4 @@
> ++## This is useless comment to test if patch works
> + ACLOCAL_AMFLAGS = -I m4
> + 
> + SUBDIRS = matchbox-panel applets data po
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 950fe723dc..9034fcae03 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -304,14 +304,19 @@ class GitApplyTree(PatchTree):
>  
>      def _isInitialized(self):
>          cmd = "git rev-parse --show-toplevel"
> -        (status, output) = subprocess.getstatusoutput(cmd.split())
> +        try:
> +            output = runcmd(cmd.split(), self.dir).strip()
> +        except CmdError as err:
> +            ## runcmd returned non-zero which most likely means 128
> +            ## Not a git directory
> +            return False
>          ## Make sure repo is in builddir to not break top-level git repos
> -        return status == 0 and os.path.samedir(output, self.dir)
> +        return os.path.samefile(output, self.dir)

output = /home/eggers/<...>/build/devel-kirkstone/tmp/work-shared/orbiter/kernel-source
self.dir = /home/eggers/<...>/build/devel-kirkstone/tmp/work/orbiter-poky-linux-musleabi/linux-stable-rt/5.10.100-rt62-orbiter+gitAUTOINC+ca44e6dff2-r0/git
os.path.samefile(output, self.dir) = 1

Looks fine now. The build on the affected CI machine is also fixed.

>  
>      def _initRepo(self):
>          runcmd("git init".split(), self.dir)
>          runcmd("git add .".split(), self.dir)
> -        runcmd("git commit -a --allow-empty -m Patching_started".split(), self.dir)
> +        runcmd("git commit -a --allow-empty -m bitbake_patching_started".split(), self.dir)
>  
>      @staticmethod
>      def extractPatchHeader(patchfile):
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
> index ce72c4bcc6..35ad9f3cd6 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -307,11 +307,26 @@ INHERIT:remove = \"report-error\"
>          src = get_bb_var("SRC_URI",test_recipe)
>          gitscm = re.search("git://", src)
>          self.assertFalse(gitscm, "test_git_patchtool pre-condition failed: {} test recipe contains git repo!".format(test_recipe))
> -        result = bitbake('man-db -c patch', ignore_status=False)
> +        result = bitbake('{} -c patch'.format(test_recipe), ignore_status=False)
>          fatal = re.search("fatal: not a git repository (or any of the parent directories)", result.output)
>          self.assertFalse(fatal, "Failed to patch using PATCHTOOL=\"git\"")
>          self.delete_recipeinc(test_recipe)
> -        bitbake('-cclean man-db')
> +        bitbake('-cclean {}'.format(test_recipe))
> +
> +    def test_git_patchtool2(self):
> +        """ Test if PATCHTOOL=git works with git repo and doesn't reinitialize it
> +        """
> +        test_recipe = "gitrepotest"
> +        src = get_bb_var("SRC_URI",test_recipe)
> +        gitscm = re.search("git://", src)
> +        self.assertTrue(gitscm, "test_git_patchtool pre-condition failed: {} test recipe doesn't contains git repo!".format(test_recipe))
> +        result = bitbake('{} -c patch'.format(test_recipe), ignore_status=False)
> +        srcdir = get_bb_var('S', test_recipe)
> +        result = runCmd("git log", cwd = srcdir)
> +        self.assertFalse("bitbake_patching_started" in result.output, msg = "Repository has been reinitialized. {}".format(srcdir))
> +        self.delete_recipeinc(test_recipe)
> +        bitbake('-cclean {}'.format(test_recipe))
> +
>  
>      def test_git_unpack_nonetwork(self):
>          """
> 
Tested-by: Christian Eggers <ceggers@arri.de>







