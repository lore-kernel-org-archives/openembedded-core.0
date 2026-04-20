Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88239F588E3
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:02:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22947.1776700962186021763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bikNIvW0;
 spf=pass (domain: axis.com, ip: 52.101.72.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdLiGDgA8IJlU928df7RTdijuR6UgHQJGLBxSpczGsTsIyBpQhpgeGDb8AN+ZLkEzeL4iIZlcur5K5Qqbtnthmlf3mXdTeW9aWhCkBEGpTugHO0XK8OPDNlJizWi6unfVzXl21UEv1P/v9w6sf1HsgauDiSim01lo3hqdbVIdCBnaPaIuorsCeBM8xi0kWm01MWpbG3fzSw7nIWmDxonkuh7azn5LTqZy9BytaqH2UncTz9g4tjsjZQAMPl5BKTm5yYkbFDWLCeDg6TgUwLcU/ZIw1q5DtuvCDB9SeMy8h7EA9FtO+ivALJM2/1y2TCqY8MGcndRYkW6PtplFJnrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBxetkXF+DJGKRfuS0AbA1oRe704Uxv+Fd+7JT0MjsE=;
 b=ZG3A3qPDItLt2BV3p8bkfr+nE5yZCp5J5Z//SWyBlzF+tnFfubrDMMLcORqaz7g/q2fw5Zk1Jq+Wk0I99gHLaVa/umcZU3VeQiPDvyf7Iph1mPE68Nx0HEE4CdggW4LAUyM9ZvDHjEsdbQoRP4OXmpogbjCIEemCw3h2cNxB1gve+t0vyN1BITAdzh6LJQye/pkP58dEib+4oKIoJBTuAv2hjfRQas1lspw51flKxLOrfVJsfJ4Y+/H1NHSjD6gsTppPDEAxZvvo9QHDN2SmUnB7GZHltU9SQWiVb4jfOjuVRuW/ztJLLUlT3VF4qHBBzvtTW44ibqtBq79MsjLSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBxetkXF+DJGKRfuS0AbA1oRe704Uxv+Fd+7JT0MjsE=;
 b=bikNIvW0Bsc3dKGxH1Oiu1iDd5VEqqwK4wJR5//SDwfurYqqanIEPiOarJwMirOOJ8nzzEOBcxBSlGi6Cf8Vhi6mCuAVMLjzFsEc+7LJOuXTKOqYutJur2YUECGMEZLF2dvRF77ZHjNeuyFJb7ZjA0dR3x20W0PvnBq6tKuJU5Q=
Received: from DU2P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::13)
 by VI1PR02MB5904.eurprd02.prod.outlook.com (2603:10a6:803:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 16:02:33 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::41) by DU2P251CA0003.outlook.office365.com
 (2603:10a6:10:230::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 16:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 16:02:32 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Mon, 20 Apr
 2026 18:02:32 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Mon, 20 Apr
 2026 18:02:32 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 20 Apr 2026 18:02:32 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 239272BCB
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 18:02:32 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F32CC120483; Mon, 20 Apr 2026 18:02:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] combo-layer: Remove the script and its associated files
Date: Mon, 20 Apr 2026 18:02:16 +0200
Message-ID: <20260420160216.1405462-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|VI1PR02MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbeabc3-db1b-499c-85b7-08de9ef63b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|13003099007|17002099007|56012099003|21046099003|18096099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZhDiDI0Ke3eN0DTBgJGN/VTu7zhYSM5w9RybuXGFIXQfgqT+WvUy5TGTW+txFfxROoeGX1hs2CpUyqcAHMkpu3HGKICIzScUPbQ4yl7mPTHNvKemkwYBPLZYI8skniGu8VSeZFBbrbdaokdgYVMVDL4W1mq1f1NqgwGEUCItGQnYlIZuh0WYyByb+AUXWUbhf8djs/gt0qcf1ISStxwzEiM61blfc/YE5vKAQsKTMQ/I3lYlv0ZIssSRT5sDRolzGtX9i5JlDoHRfGEIvQIpRzlBiBupnz970Dtzc4smrLLX13JyjL1xUdCC6CN4+aLUcaj+AOZ8w5EC6hHDAGBkC+pPJRMFEMfcz2JwC2wBL7WgChjQZVCGoMhHBfkCJaqxEdPj0viFSW+ljOmGyOM97GbY6zGyF6mf9SM81vU8UW3fI9+lKm3cD6dYrF+/jKgN13jfoITTc5wS+Fje6YQuBvts6qZbA5hh5mejEZ5q5uP8y69Ynx0Gbmtj2e1gyhP9NAwUdAdkK4/RvfY1/WQIXCDA0NS7NQuf9N8/Lom5oWqosBhM2ZPQSVlHkNK4IURzXxebz7dmJ0IBt+10W/x094DYidf13aUXCWRPQq0WA4alWGr60eS5kcve/yBr9N3PFeEXA8l/jpsCVxoIRfsYcA3BRscjS/VnPn2YHiPr3na3cbASrlNwfkde1LqBTwkPUqnqKWz9OnNDX73+rkObkMtmN0mBAySk5fjtYq1PvkA=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(17002099007)(56012099003)(21046099003)(18096099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KfFYMUB/sWq0AFSUQL13AbhozS1EIvrbgxxepxIpdrZauJoHtOeMqX1lFV4gUQaaVPELRu8KWiV3IiSwxUIyVUY7n8ZBSjDzcehW5wef9VCAEvf1ZaH/E2pXHRM5j0zzIUMS7kByFURGb+PbXLiWzT+nbMAb5a5m1ZVST1uPTHzx8czgCb8/dpnAdZZTQXSpWVZwUrFhbG0/weucmBn+XzL/RHLTHpjjfRRUotpOXpmtOcoGuGi28XN8SkeOkZzqzWpZ+l7Nl+397AyV2NY2/OWKt1kA3f7eRBr5chCPyzsxlkaI1BoAimJ078vdl7Itxdd60U9wZFW1kNvwmEfuEM/BgUwfpY90ruMlmfqtTY1lZCunhiYA8bulXhAChful0iSSn9juluv0iwfOcDyLA7t9ss6eTeu3WFHc00jqezHU7tAev6NqfiZJC6H9Ndkp
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 16:02:32.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbeabc3-db1b-499c-85b7-08de9ef63b3c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235572

The combo-layer script has not been used with master of OE-Core since
the poky repository stopped being updated.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/combo-layer                 | 1384 ---------------------------
 scripts/combo-layer-hook-default.sh |   25 -
 scripts/combo-layer.conf.example    |   93 --
 3 files changed, 1502 deletions(-)
 delete mode 100755 scripts/combo-layer
 delete mode 100755 scripts/combo-layer-hook-default.sh
 delete mode 100644 scripts/combo-layer.conf.example

diff --git a/scripts/combo-layer b/scripts/combo-layer
deleted file mode 100755
index 4a715914af..0000000000
--- a/scripts/combo-layer
+++ /dev/null
@@ -1,1384 +0,0 @@
-#!/usr/bin/env python3
-# ex:ts=3D4:sw=3D4:sts=3D4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright 2011 Intel Corporation
-# Authored-by:  Yu Ke <ke.yu@intel.com>
-#               Paul Eggleton <paul.eggleton@intel.com>
-#               Richard Purdie <richard.purdie@intel.com>
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import fnmatch
-import os, sys
-import optparse
-import logging
-import subprocess
-import tempfile
-import configparser
-import re
-import copy
-import shlex
-import shutil
-from string import Template
-from functools import reduce
-
-__version__ =3D "0.2.1"
-
-def logger_create():
-    logger =3D logging.getLogger("")
-    loggerhandler =3D logging.StreamHandler()
-    loggerhandler.setFormatter(logging.Formatter("[%(asctime)s] %(message)=
s","%H:%M:%S"))
-    logger.addHandler(loggerhandler)
-    logger.setLevel(logging.INFO)
-    return logger
-
-logger =3D logger_create()
-
-def get_current_branch(repodir=3DNone):
-    try:
-        if not os.path.exists(os.path.join(repodir if repodir else '', ".g=
it")):
-            # Repo not created yet (i.e. during init) so just assume maste=
r
-            return "master"
-        branchname =3D runcmd("git symbolic-ref HEAD 2>/dev/null", repodir=
).strip()
-        if branchname.startswith("refs/heads/"):
-            branchname =3D branchname[11:]
-        return branchname
-    except subprocess.CalledProcessError:
-        return ""
-
-class Configuration(object):
-    """
-    Manages the configuration
-
-    For an example config file, see combo-layer.conf.example
-
-    """
-    def __init__(self, options):
-        for key, val in options.__dict__.items():
-            setattr(self, key, val)
-
-        def readsection(parser, section, repo):
-            for (name, value) in parser.items(section):
-                if value.startswith("@"):
-                    self.repos[repo][name] =3D eval(value.strip("@"))
-                else:
-                    # Apply special type transformations for some properti=
es.
-                    # Type matches the RawConfigParser.get*() methods.
-                    types =3D {'signoff': 'boolean', 'update': 'boolean', =
'history': 'boolean'}
-                    if name in types:
-                        value =3D getattr(parser, 'get' + types[name])(sec=
tion, name)
-                    self.repos[repo][name] =3D value
-
-        def readglobalsection(parser, section):
-            for (name, value) in parser.items(section):
-                if name =3D=3D "commit_msg":
-                    self.commit_msg_template =3D value
-
-        logger.debug("Loading config file %s" % self.conffile)
-        self.parser =3D configparser.ConfigParser()
-        with open(self.conffile) as f:
-            self.parser.read_file(f)
-
-        # initialize default values
-        self.commit_msg_template =3D "Automatic commit to update last_revi=
sion"
-
-        self.repos =3D {}
-        for repo in self.parser.sections():
-            if repo =3D=3D "combo-layer-settings":
-                # special handling for global settings
-                readglobalsection(self.parser, repo)
-            else:
-                self.repos[repo] =3D {}
-                readsection(self.parser, repo, repo)
-
-        # Load local configuration, if available
-        self.localconffile =3D None
-        self.localparser =3D None
-        self.combobranch =3D None
-        if self.conffile.endswith('.conf'):
-            lcfile =3D self.conffile.replace('.conf', '-local.conf')
-            if os.path.exists(lcfile):
-                # Read combo layer branch
-                self.combobranch =3D get_current_branch()
-                logger.debug("Combo layer branch is %s" % self.combobranch=
)
-
-                self.localconffile =3D lcfile
-                logger.debug("Loading local config file %s" % self.localco=
nffile)
-                self.localparser =3D configparser.ConfigParser()
-                with open(self.localconffile) as f:
-                    self.localparser.readfp(f)
-
-                for section in self.localparser.sections():
-                    if '|' in section:
-                        sectionvals =3D section.split('|')
-                        repo =3D sectionvals[0]
-                        if sectionvals[1] !=3D self.combobranch:
-                            continue
-                    else:
-                        repo =3D section
-                    if repo in self.repos:
-                        readsection(self.localparser, section, repo)
-
-    def update(self, repo, option, value, initmode=3DFalse):
-        # If the main config has the option already, that is what we
-        # are expected to modify.
-        if self.localparser and not self.parser.has_option(repo, option):
-            parser =3D self.localparser
-            section =3D "%s|%s" % (repo, self.combobranch)
-            conffile =3D self.localconffile
-            if initmode and not parser.has_section(section):
-                parser.add_section(section)
-        else:
-            parser =3D self.parser
-            section =3D repo
-            conffile =3D self.conffile
-        parser.set(section, option, value)
-        with open(conffile, "w") as f:
-            parser.write(f)
-        self.repos[repo][option] =3D value
-
-    def sanity_check(self, initmode=3DFalse):
-        required_options=3D["src_uri", "local_repo_dir", "dest_dir", "last=
_revision"]
-        if initmode:
-            required_options.remove("last_revision")
-        msg =3D ""
-        missing_options =3D []
-        for name in self.repos:
-            for option in required_options:
-                if option not in self.repos[name]:
-                    msg =3D "%s\nOption %s is not defined for component %s=
" %(msg, option, name)
-                    missing_options.append(option)
-            # Sanitize dest_dir so that we do not have to deal with edge c=
ases
-            # (unset, empty string, double slashes) in the rest of the cod=
e.
-            # It not being set will still be flagged as error because it i=
s
-            # listed as required option above; that could be changed now.
-            dest_dir =3D os.path.normpath(self.repos[name].get("dest_dir",=
 "."))
-            self.repos[name]["dest_dir"] =3D "." if not dest_dir else dest=
_dir
-        if msg !=3D "":
-            logger.error("configuration file %s has the following error: %=
s" % (self.conffile,msg))
-            if self.localconffile and 'last_revision' in missing_options:
-                logger.error("local configuration file %s may be missing c=
onfiguration for combo branch %s" % (self.localconffile, self.combobranch))
-            sys.exit(1)
-
-        # filterdiff is required by action_splitpatch, so check its availa=
bility
-        if subprocess.call("which filterdiff > /dev/null 2>&1", shell=3DTr=
ue) !=3D 0:
-            logger.error("ERROR: patchutils package is missing, please ins=
tall it (e.g. # apt-get install patchutils)")
-            sys.exit(1)
-
-def runcmd(cmd,destdir=3DNone,printerr=3DTrue,out=3DNone,env=3DNone):
-    """
-        execute command, raise CalledProcessError if fail
-        return output if succeed
-    """
-    logger.debug("run cmd '%s' in %s" % (cmd, os.getcwd() if destdir is No=
ne else destdir))
-    if not out:
-        out =3D tempfile.TemporaryFile()
-        err =3D out
-    else:
-        err =3D tempfile.TemporaryFile()
-    try:
-        subprocess.check_call(cmd, stdout=3Dout, stderr=3Derr, cwd=3Ddestd=
ir, shell=3Disinstance(cmd, str), env=3Denv or os.environ)
-    except subprocess.CalledProcessError as e:
-        err.seek(0)
-        if printerr:
-            logger.error("%s" % err.read())
-        raise e
-
-    err.seek(0)
-    output =3D err.read().decode('utf-8')
-    logger.debug("output: %s" % output.replace(chr(0), '\\0'))
-    return output
-
-def action_sync_revs(conf, args):
-    """
-    Update the last_revision config option for each repo with the latest
-    revision in the remote's branch. Useful if multiple people are using
-    combo-layer.
-    """
-    repos =3D get_repos(conf, args[1:])
-
-    for name in repos:
-        repo =3D conf.repos[name]
-        ldir =3D repo['local_repo_dir']
-        branch =3D repo.get('branch', "master")
-        runcmd("git fetch", ldir)
-        lastrev =3D runcmd('git rev-parse origin/%s' % branch, ldir).strip=
()
-        print("Updating %s to %s" % (name, lastrev))
-        conf.update(name, "last_revision", lastrev)
-
-def action_init(conf, args):
-    """
-        Clone component repositories
-        Check git is initialised; if not, copy initial data from component=
 repos
-    """
-    for name in conf.repos:
-        ldir =3D conf.repos[name]['local_repo_dir']
-        if not os.path.exists(ldir):
-            logger.info("cloning %s to %s" %(conf.repos[name]['src_uri'], =
ldir))
-            subprocess.check_call("git clone %s %s" % (conf.repos[name]['s=
rc_uri'], ldir), shell=3DTrue)
-    if not os.path.exists(".git"):
-        runcmd("git init")
-        if conf.history:
-            # Need a common ref for all trees.
-            runcmd('git commit -m "initial empty commit" --allow-empty')
-            startrev =3D runcmd('git rev-parse master').strip()
-
-        for name in conf.repos:
-            repo =3D conf.repos[name]
-            ldir =3D repo['local_repo_dir']
-            branch =3D repo.get('branch', "master")
-            lastrev =3D repo.get('last_revision', None)
-            if lastrev and lastrev !=3D "HEAD":
-                initialrev =3D lastrev
-                if branch:
-                    if not check_rev_branch(name, ldir, lastrev, branch):
-                        sys.exit(1)
-                logger.info("Copying data from %s at specified revision %s=
..." % (name, lastrev))
-            else:
-                lastrev =3D None
-                initialrev =3D branch
-                logger.info("Copying data from %s..." % name)
-            # Sanity check initialrev and turn it into hash (required for =
copying history,
-            # because resolving a name ref only works in the component rep=
o).
-            rev =3D runcmd('git rev-parse %s' % initialrev, ldir).strip()
-            if rev !=3D initialrev:
-                try:
-                    refs =3D runcmd('git show-ref -s %s' % initialrev, ldi=
r).split('\n')
-                    if len(set(refs)) > 1:
-                        # Happens for example when configured to track
-                        # "master" and there is a refs/heads/master. The
-                        # traditional behavior from "git archive" (preserv=
ed
-                        # here) it to choose the first one. This might not=
 be
-                        # intended, so at least warn about it.
-                        logger.warning("%s: initial revision '%s' not uniq=
ue, picking result of rev-parse =3D %s" %
-                                    (name, initialrev, refs[0]))
-                        initialrev =3D rev
-                except:
-                    # show-ref fails for hashes. Skip the sanity warning i=
n that case.
-                    pass
-                initialrev =3D rev
-            dest_dir =3D repo['dest_dir']
-            if dest_dir !=3D ".":
-                extract_dir =3D os.path.join(os.getcwd(), dest_dir)
-                if not os.path.exists(extract_dir):
-                    os.makedirs(extract_dir)
-            else:
-                extract_dir =3D os.getcwd()
-            file_filter =3D repo.get('file_filter', "")
-            exclude_patterns =3D repo.get('file_exclude', '').split()
-            def copy_selected_files(initialrev, extract_dir, file_filter, =
exclude_patterns, ldir,
-                                    subdir=3D""):
-                # When working inside a filtered branch which had the
-                # files already moved, we need to prepend the
-                # subdirectory to all filters, otherwise they would
-                # not match.
-                if subdir =3D=3D '.':
-                    subdir =3D ''
-                elif subdir:
-                    subdir =3D os.path.normpath(subdir)
-                    file_filter =3D ' '.join([subdir + '/' + x for x in fi=
le_filter.split()])
-                    exclude_patterns =3D [subdir + '/' + x for x in exclud=
e_patterns]
-                # To handle both cases, we cd into the target
-                # directory and optionally tell tar to strip the path
-                # prefix when the files were already moved.
-                subdir_components =3D len(subdir.split(os.path.sep)) if su=
bdir else 0
-                strip=3D('--strip-components=3D%d' % subdir_components) if=
 subdir else ''
-                # TODO: file_filter wild cards do not work (and haven't wo=
rked before either), because
-                # a) GNU tar requires a --wildcards parameter before turni=
ng on wild card matching.
-                # b) The semantic is not as intendend (src/*.c also matche=
s src/foo/bar.c,
-                #    in contrast to the other use of file_filter as parame=
ter of "git archive"
-                #    where it only matches .c files directly in src).
-                files =3D runcmd("git archive %s %s | tar -x -v %s -C %s %=
s" %
-                               (initialrev, subdir,
-                                strip, extract_dir, file_filter),
-                               ldir)
-                if exclude_patterns:
-                    # Implement file removal by letting tar create the
-                    # file and then deleting it in the file system
-                    # again. Uses the list of files created by tar (easier
-                    # than walking the tree).
-                    for file in files.split('\n'):
-                        if file.endswith(os.path.sep):
-                            continue
-                        for pattern in exclude_patterns:
-                            if fnmatch.fnmatch(file, pattern):
-                                os.unlink(os.path.join(*([extract_dir] + [=
'..'] * subdir_components + [file])))
-                                break
-
-            if not conf.history:
-                copy_selected_files(initialrev, extract_dir, file_filter, =
exclude_patterns, ldir)
-            else:
-                # First fetch remote history into local repository.
-                # We need a ref for that, so ensure that there is one.
-                refname =3D "combo-layer-init-%s" % name
-                runcmd("git branch -f %s %s" % (refname, initialrev), ldir=
)
-                runcmd("git fetch %s %s" % (ldir, refname))
-                runcmd("git branch -D %s" % refname, ldir)
-                # Make that the head revision.
-                runcmd("git checkout -b %s %s" % (name, initialrev))
-                # Optional: cut the history by replacing the given
-                # start point(s) with commits providing the same
-                # content (aka tree), but with commit information that
-                # makes it clear that this is an artifically created
-                # commit and nothing the original authors had anything
-                # to do with.
-                since_rev =3D repo.get('since_revision', '')
-                if since_rev:
-                    committer =3D runcmd('git var GIT_AUTHOR_IDENT').strip=
()
-                    # Same time stamp, no name.
-                    author =3D re.sub('.* (\d+ [+-]\d+)', r'unknown <unkno=
wn> \1', committer)
-                    logger.info('author %s' % author)
-                    for rev in since_rev.split():
-                        # Resolve in component repo...
-                        rev =3D runcmd('git log --oneline --no-abbrev-comm=
it -n1 %s' % rev, ldir).split()[0]
-                        # ... and then get the tree in current
-                        # one. The commit should be in both repos with
-                        # the same tree, but better check here.
-                        tree =3D runcmd('git show -s --pretty=3Dformat:%%T=
 %s' % rev).strip()
-                        with tempfile.NamedTemporaryFile(mode=3D'wt') as e=
ditor:
-                            editor.write('''cat >$1 <<EOF
-tree %s
-author %s
-committer %s
-
-%s: squashed import of component
-
-This commit copies the entire set of files as found in
-%s %s
-
-For more information about previous commits, see the
-upstream repository.
-
-Commit created by combo-layer.
-EOF
-''' % (tree, author, committer, name, name, since_rev))
-                            editor.flush()
-                            os.environ['GIT_EDITOR'] =3D 'sh %s' % editor.=
name
-                            runcmd('git replace --edit %s' % rev)
-
-                # Optional: rewrite history to change commit messages or t=
o move files.
-                if 'hook' in repo or dest_dir !=3D ".":
-                    filter_branch =3D ['git', 'filter-branch', '--force']
-                    with tempfile.NamedTemporaryFile(mode=3D'wt') as hookw=
rapper:
-                        if 'hook' in repo:
-                            # Create a shell script wrapper around the ori=
ginal hook that
-                            # can be used by git filter-branch. Hook may o=
r may not have
-                            # an absolute path.
-                            hook =3D repo['hook']
-                            hook =3D os.path.join(os.path.dirname(conf.con=
ffile), '..', hook)
-                            # The wrappers turns the commit message
-                            # from stdin into a fake patch header.
-                            # This is good enough for changing Subject
-                            # and commit msg body with normal
-                            # combo-layer hooks.
-                            hookwrapper.write('''set -e
-tmpname=3D$(mktemp)
-trap "rm $tmpname" EXIT
-echo -n 'Subject: [PATCH] ' >>$tmpname
-cat >>$tmpname
-if ! [ $(tail -c 1 $tmpname | od -A n -t x1) =3D=3D '0a' ]; then
-    echo >>$tmpname
-fi
-echo '---' >>$tmpname
-%s $tmpname $GIT_COMMIT %s
-tail -c +18 $tmpname | head -c -4
-''' % (hook, name))
-                            hookwrapper.flush()
-                            filter_branch.extend(['--msg-filter', 'bash %s=
' % hookwrapper.name])
-                        if dest_dir !=3D ".":
-                            parent =3D os.path.dirname(dest_dir)
-                            if not parent:
-                                parent =3D '.'
-                            # May run outside of the current directory, so=
 do not assume that .git exists.
-                            filter_branch.extend(['--tree-filter', 'mkdir =
-p .git/tmptree && find . -mindepth 1 -maxdepth 1 ! -name .git -print0 | xa=
rgs -0 -I SOURCE mv SOURCE .git/tmptree && mkdir -p %s && mv .git/tmptree %=
s' % (parent, dest_dir)])
-                        filter_branch.append('HEAD')
-                        runcmd(filter_branch)
-                        runcmd('git update-ref -d refs/original/refs/heads=
/%s' % name)
-                repo['rewritten_revision'] =3D runcmd('git rev-parse HEAD'=
).strip()
-                repo['stripped_revision'] =3D repo['rewritten_revision']
-                # Optional filter files: remove everything and re-populate=
 using the normal filtering code.
-                # Override any potential .gitignore.
-                if file_filter or exclude_patterns:
-                    runcmd('git rm -rf .')
-                    if not os.path.exists(extract_dir):
-                        os.makedirs(extract_dir)
-                    copy_selected_files('HEAD', extract_dir, file_filter, =
exclude_patterns, '.',
-                                        subdir=3Ddest_dir)
-                    runcmd('git add --all --force .')
-                    if runcmd('git status --porcelain'):
-                        # Something to commit.
-                        runcmd(['git', 'commit', '-m',
-                                '''%s: select file subset
-
-Files from the component repository were chosen based on
-the following filters:
-file_filter =3D %s
-file_exclude =3D %s''' % (name, file_filter or '<empty>', repo.get('file_e=
xclude', '<empty>'))])
-                        repo['stripped_revision'] =3D runcmd('git rev-pars=
e HEAD').strip()
-
-            if not lastrev:
-                lastrev =3D runcmd('git rev-parse %s' % initialrev, ldir).=
strip()
-                conf.update(name, "last_revision", lastrev, initmode=3DTru=
e)
-
-        if not conf.history:
-            runcmd("git add .")
-        else:
-            # Create Octopus merge commit according to http://stackoverflo=
w.com/questions/10874149/git-octopus-merge-with-unrelated-repositoies
-            runcmd('git checkout master')
-            merge =3D ['git', 'merge', '--no-commit']
-            for name in conf.repos:
-                repo =3D conf.repos[name]
-                # Use branch created earlier.
-                merge.append(name)
-                # Root all commits which have no parent in the common
-                # ancestor in the new repository.
-                for start in runcmd('git log --pretty=3Dformat:%%H --max-p=
arents=3D0 %s --' % name).split('\n'):
-                    runcmd('git replace --graft %s %s' % (start, startrev)=
)
-            try:
-                runcmd(merge)
-            except Exception as error:
-                logger.info('''Merging component repository history failed=
, perhaps because of merge conflicts.
-It may be possible to commit anyway after resolving these conflicts.
-
-%s''' % error)
-            # Create MERGE_HEAD and MERGE_MSG. "git merge" itself
-            # does not create MERGE_HEAD in case of a (harmless) failure,
-            # and we want certain auto-generated information in the
-            # commit message for future reference and/or automation.
-            with open('.git/MERGE_HEAD', 'w') as head:
-                with open('.git/MERGE_MSG', 'w') as msg:
-                    msg.write('repo: initial import of components\n\n')
-                    # head.write('%s\n' % startrev)
-                    for name in conf.repos:
-                        repo =3D conf.repos[name]
-                        # <upstream ref> <rewritten ref> <rewritten + file=
s removed>
-                        msg.write('combo-layer-%s: %s %s %s\n' % (name,
-                                                                  repo['la=
st_revision'],
-                                                                  repo['re=
written_revision'],
-                                                                  repo['st=
ripped_revision']))
-                        rev =3D runcmd('git rev-parse %s' % name).strip()
-                        head.write('%s\n' % rev)
-
-        if conf.localconffile:
-            localadded =3D True
-            try:
-                runcmd("git rm --cached %s" % conf.localconffile, printerr=
=3DFalse)
-            except subprocess.CalledProcessError:
-                localadded =3D False
-            if localadded:
-                localrelpath =3D os.path.relpath(conf.localconffile)
-                runcmd("grep -q %s .gitignore || echo %s >> .gitignore" % =
(localrelpath, localrelpath))
-                runcmd("git add .gitignore")
-                logger.info("Added local configuration file %s to .gitigno=
re", localrelpath)
-        logger.info("Initial combo layer repository data has been created;=
 please make any changes if desired and then use 'git commit' to make the i=
nitial commit.")
-    else:
-        logger.info("Repository already initialised, nothing to do.")
-
-
-def check_repo_clean(repodir):
-    """
-        check if the repo is clean
-        exit if repo is dirty
-    """
-    output=3Druncmd("git status --porcelain", repodir)
-    r =3D re.compile(r'\?\? patch-.*/')
-    dirtyout =3D [item for item in output.splitlines() if not r.match(item=
)]
-    if dirtyout:
-        logger.error("git repo %s is dirty, please fix it first", repodir)
-        sys.exit(1)
-
-def check_patch(patchfile):
-    f =3D open(patchfile, 'rb')
-    ln =3D f.readline()
-    of =3D None
-    in_patch =3D False
-    beyond_msg =3D False
-    pre_buf =3D b''
-    while ln:
-        if not beyond_msg:
-            if ln =3D=3D b'---\n':
-                if not of:
-                    break
-                in_patch =3D False
-                beyond_msg =3D True
-            elif ln.startswith(b'--- '):
-                # We have a diff in the commit message
-                in_patch =3D True
-                if not of:
-                    print('WARNING: %s contains a diff in its commit messa=
ge, indenting to avoid failure during apply' % patchfile)
-                    of =3D open(patchfile + '.tmp', 'wb')
-                    of.write(pre_buf)
-                    pre_buf =3D b''
-            elif in_patch and not ln[0] in b'+-@ \n\r':
-                in_patch =3D False
-        if of:
-            if in_patch:
-                of.write(b' ' + ln)
-            else:
-                of.write(ln)
-        else:
-            pre_buf +=3D ln
-        ln =3D f.readline()
-    f.close()
-    if of:
-        of.close()
-        os.rename(of.name, patchfile)
-
-def drop_to_shell(workdir=3DNone):
-    if not sys.stdin.isatty():
-        print("Not a TTY so can't drop to shell for resolution, exiting.")
-        return False
-
-    shell =3D os.environ.get('SHELL', 'bash')
-    print('Dropping to shell "%s"\n' \
-          'When you are finished, run the following to continue:\n' \
-          '       exit    -- continue to apply the patches\n' \
-          '       exit 1  -- abort\n' % shell);
-    ret =3D subprocess.call([shell], cwd=3Dworkdir)
-    if ret !=3D 0:
-        print("Aborting")
-        return False
-    else:
-        return True
-
-def check_rev_branch(component, repodir, rev, branch):
-    try:
-        actualbranch =3D runcmd("git branch --contains %s" % rev, repodir,=
 printerr=3DFalse)
-    except subprocess.CalledProcessError as e:
-        if e.returncode =3D=3D 129:
-            actualbranch =3D ""
-        else:
-            raise
-
-    if not actualbranch:
-        logger.error("%s: specified revision %s is invalid!" % (component,=
 rev))
-        return False
-
-    branches =3D []
-    branchlist =3D actualbranch.split("\n")
-    for b in branchlist:
-        branches.append(b.strip().split(' ')[-1])
-
-    if branch not in branches:
-        logger.error("%s: specified revision %s is not on specified branch=
 %s!" % (component, rev, branch))
-        return False
-    return True
-
-def get_repos(conf, repo_names):
-    repos =3D []
-    for name in repo_names:
-        if name.startswith('-'):
-            break
-        else:
-            repos.append(name)
-    for repo in repos:
-        if not repo in conf.repos:
-            logger.error("Specified component '%s' not found in configurat=
ion" % repo)
-            sys.exit(1)
-
-    if not repos:
-        repos =3D [ repo for repo in conf.repos if conf.repos[repo].get("u=
pdate", True) ]
-
-    return repos
-
-def action_pull(conf, args):
-    """
-        update the component repos only
-    """
-    repos =3D get_repos(conf, args[1:])
-
-    # make sure all repos are clean
-    for name in repos:
-        check_repo_clean(conf.repos[name]['local_repo_dir'])
-
-    for name in repos:
-        repo =3D conf.repos[name]
-        ldir =3D repo['local_repo_dir']
-        branch =3D repo.get('branch', "master")
-        logger.info("update branch %s of component repo %s in %s ..." % (b=
ranch, name, ldir))
-        if not conf.hard_reset:
-            # Try to pull only the configured branch. Beware that this may=
 fail
-            # when the branch is currently unknown (for example, after rec=
onfiguring
-            # combo-layer). In that case we need to fetch everything and t=
ry the check out
-            # and pull again.
-            try:
-                runcmd("git checkout %s" % branch, ldir, printerr=3DFalse)
-            except subprocess.CalledProcessError:
-                output=3Druncmd("git fetch", ldir)
-                logger.info(output)
-                runcmd("git checkout %s" % branch, ldir)
-                runcmd("git pull --ff-only", ldir)
-            else:
-                output=3Druncmd("git pull --ff-only", ldir)
-                logger.info(output)
-        else:
-            output=3Druncmd("git fetch", ldir)
-            logger.info(output)
-            runcmd("git checkout %s" % branch, ldir)
-            runcmd("git reset --hard FETCH_HEAD", ldir)
-
-def action_update(conf, args):
-    """
-        update the component repos
-        either:
-           generate the patch list
-           apply the generated patches
-        or:
-           re-creates the entire component history and merges them
-           into the current branch with a merge commit
-    """
-    components =3D [arg.split(':')[0] for arg in args[1:]]
-    revisions =3D {}
-    for arg in args[1:]:
-        if ':' in arg:
-            a =3D arg.split(':', 1)
-            revisions[a[0]] =3D a[1]
-    repos =3D get_repos(conf, components)
-
-    # make sure combo repo is clean
-    check_repo_clean(os.getcwd())
-
-    # Check whether we keep the component histories. Must be
-    # set either via --history command line parameter or consistently
-    # in combo-layer.conf. Mixing modes is (currently, and probably
-    # permanently because it would be complicated) not supported.
-    if conf.history:
-        history =3D True
-    else:
-        history =3D None
-        for name in repos:
-            repo =3D conf.repos[name]
-            repo_history =3D repo.get('history', False)
-            if history is None:
-                history =3D repo_history
-            elif history !=3D repo_history:
-                logger.error("'history' property is set inconsistently")
-                sys.exit(1)
-
-    # Step 1: update the component repos
-    if conf.nopull:
-        logger.info("Skipping pull (-n)")
-    else:
-        action_pull(conf, ['arg0'] + components)
-
-    if history:
-        update_with_history(conf, components, revisions, repos)
-    else:
-        update_with_patches(conf, components, revisions, repos)
-
-def update_with_patches(conf, components, revisions, repos):
-    import uuid
-    patch_dir =3D "patch-%s" % uuid.uuid4()
-    if not os.path.exists(patch_dir):
-        os.mkdir(patch_dir)
-
-    for name in repos:
-        revision =3D revisions.get(name, None)
-        repo =3D conf.repos[name]
-        ldir =3D repo['local_repo_dir']
-        dest_dir =3D repo['dest_dir']
-        branch =3D repo.get('branch', "master")
-        repo_patch_dir =3D os.path.join(os.getcwd(), patch_dir, name)
-
-        # Step 2: generate the patch list and store to patch dir
-        logger.info("Generating patches from %s..." % name)
-        top_revision =3D revision or branch
-        if not check_rev_branch(name, ldir, top_revision, branch):
-            sys.exit(1)
-        if dest_dir !=3D ".":
-            prefix =3D "--src-prefix=3Da/%s/ --dst-prefix=3Db/%s/" % (dest=
_dir, dest_dir)
-        else:
-            prefix =3D ""
-        if repo['last_revision'] =3D=3D "":
-            logger.info("Warning: last_revision of component %s is not set=
, starting from the first commit" % name)
-            patch_cmd_range =3D "--root %s" % top_revision
-            rev_cmd_range =3D top_revision
-        else:
-            if not check_rev_branch(name, ldir, repo['last_revision'], bra=
nch):
-                sys.exit(1)
-            patch_cmd_range =3D "%s..%s" % (repo['last_revision'], top_rev=
ision)
-            rev_cmd_range =3D patch_cmd_range
-
-        file_filter =3D repo.get('file_filter',".")
-
-        # Filter out unwanted files
-        exclude =3D repo.get('file_exclude', '')
-        if exclude:
-            for path in exclude.split():
-                p =3D "%s/%s" % (dest_dir, path) if dest_dir !=3D '.' else=
 path
-                file_filter +=3D " ':!%s'" % p
-
-        patch_cmd =3D "git format-patch -N %s --output-directory %s %s -- =
%s" % \
-            (prefix,repo_patch_dir, patch_cmd_range, file_filter)
-        output =3D runcmd(patch_cmd, ldir)
-        logger.debug("generated patch set:\n%s" % output)
-        patchlist =3D output.splitlines()
-
-        rev_cmd =3D "git rev-list --no-merges %s -- %s" % (rev_cmd_range, =
file_filter)
-        revlist =3D runcmd(rev_cmd, ldir).splitlines()
-
-        # Step 3: Call repo specific hook to adjust patch
-        if 'hook' in repo:
-            # hook parameter is: ./hook patchpath revision reponame
-            count=3Dlen(revlist)-1
-            for patch in patchlist:
-                runcmd("%s %s %s %s" % (repo['hook'], patch, revlist[count=
], name))
-                count=3Dcount-1
-
-        # Step 4: write patch list and revision list to file, for user to =
edit later
-        patchlist_file =3D os.path.join(os.getcwd(), patch_dir, "patchlist=
-%s" % name)
-        repo['patchlist'] =3D patchlist_file
-        f =3D open(patchlist_file, 'w')
-        count=3Dlen(revlist)-1
-        for patch in patchlist:
-            f.write("%s %s\n" % (patch, revlist[count]))
-            check_patch(os.path.join(patch_dir, patch))
-            count=3Dcount-1
-        f.close()
-
-    # Step 5: invoke bash for user to edit patch and patch list
-    if conf.interactive:
-        print('You may now edit the patch and patch list in %s\n' \
-              'For example, you can remove unwanted patch entries from pat=
chlist-*, so that they will be not applied later' % patch_dir);
-        if not drop_to_shell(patch_dir):
-            sys.exit(1)
-
-    # Step 6: apply the generated and revised patch
-    apply_patchlist(conf, repos)
-    runcmd("rm -rf %s" % patch_dir)
-
-    # Step 7: commit the updated config file if it's being tracked
-    commit_conf_file(conf, components)
-
-def conf_commit_msg(conf, components):
-    # create the "components" string
-    component_str =3D "all components"
-    if len(components) > 0:
-        # otherwise tell which components were actually changed
-        component_str =3D ", ".join(components)
-
-    # expand the template with known values
-    template =3D Template(conf.commit_msg_template)
-    msg =3D template.substitute(components =3D component_str)
-    return msg
-
-def commit_conf_file(conf, components, commit=3DTrue):
-    relpath =3D os.path.relpath(conf.conffile)
-    try:
-        output =3D runcmd("git status --porcelain %s" % relpath, printerr=
=3DFalse)
-    except:
-        # Outside the repository
-        output =3D None
-    if output:
-        if output.lstrip().startswith("M"):
-            logger.info("Committing updated configuration file")
-            if commit:
-                msg =3D conf_commit_msg(conf, components)
-                runcmd('git commit -m'.split() + [msg, relpath])
-            else:
-                runcmd('git add %s' % relpath)
-            return True
-    return False
-
-def apply_patchlist(conf, repos):
-    """
-        apply the generated patch list to combo repo
-    """
-    for name in repos:
-        repo =3D conf.repos[name]
-        lastrev =3D repo["last_revision"]
-        prevrev =3D lastrev
-
-        # Get non-blank lines from patch list file
-        patchlist =3D []
-        if os.path.exists(repo['patchlist']) or not conf.interactive:
-            # Note: we want this to fail here if the file doesn't exist an=
d we're not in
-            # interactive mode since the file should exist in this case
-            with open(repo['patchlist']) as f:
-                for line in f:
-                    line =3D line.rstrip()
-                    if line:
-                        patchlist.append(line)
-
-        ldir =3D conf.repos[name]['local_repo_dir']
-        branch =3D conf.repos[name].get('branch', "master")
-        branchrev =3D runcmd("git rev-parse %s" % branch, ldir).strip()
-
-        if patchlist:
-            logger.info("Applying patches from %s..." % name)
-            linecount =3D len(patchlist)
-            i =3D 1
-            for line in patchlist:
-                patchfile =3D line.split()[0]
-                lastrev =3D line.split()[1]
-                patchdisp =3D os.path.relpath(patchfile)
-                if os.path.getsize(patchfile) =3D=3D 0:
-                    logger.info("(skipping %d/%d %s - no changes)" % (i, l=
inecount, patchdisp))
-                else:
-                    cmd =3D "git am --keep-cr %s-p1 %s" % ('-s ' if repo.g=
et('signoff', True) else '', patchfile)
-                    logger.info("Applying %d/%d: %s" % (i, linecount, patc=
hdisp))
-                    try:
-                        runcmd(cmd)
-                    except subprocess.CalledProcessError:
-                        logger.info('Running "git am --abort" to cleanup r=
epo')
-                        runcmd("git am --abort")
-                        logger.error('"%s" failed' % cmd)
-                        logger.info("Please manually apply patch %s" % pat=
chdisp)
-                        logger.info("Note: if you exit and continue applyi=
ng without manually applying the patch, it will be skipped")
-                        if not drop_to_shell():
-                            if prevrev !=3D repo['last_revision']:
-                                conf.update(name, "last_revision", prevrev=
)
-                            sys.exit(1)
-                prevrev =3D lastrev
-                i +=3D 1
-            # Once all patches are applied, we should update
-            # last_revision to the branch head instead of the last
-            # applied patch. The two are not necessarily the same when
-            # the last commit is a merge commit or when the patches at
-            # the branch head were intentionally excluded.
-            #
-            # If we do not do that for a merge commit, the next
-            # combo-layer run will only exclude patches reachable from
-            # one of the merged branches and try to re-apply patches
-            # from other branches even though they were already
-            # copied.
-            #
-            # If patches were intentionally excluded, the next run will
-            # present them again instead of skipping over them. This
-            # may or may not be intended, so the code here is conservative
-            # and only addresses the "head is merge commit" case.
-            if lastrev !=3D branchrev and \
-               len(runcmd("git show --pretty=3Dformat:%%P --no-patch %s" %=
 branch, ldir).split()) > 1:
-                lastrev =3D branchrev
-        else:
-            logger.info("No patches to apply from %s" % name)
-            lastrev =3D branchrev
-
-        if lastrev !=3D repo['last_revision']:
-            conf.update(name, "last_revision", lastrev)
-
-def action_splitpatch(conf, args):
-    """
-        generate the commit patch and
-        split the patch per repo
-    """
-    logger.debug("action_splitpatch")
-    if len(args) > 1:
-        commit =3D args[1]
-    else:
-        commit =3D "HEAD"
-    patchdir =3D "splitpatch-%s" % commit
-    if not os.path.exists(patchdir):
-        os.mkdir(patchdir)
-
-    # filerange_root is for the repo whose dest_dir is root "."
-    # and it should be specified by excluding all other repo dest dir
-    # like "-x repo1 -x repo2 -x repo3 ..."
-    filerange_root =3D ""
-    for name in conf.repos:
-        dest_dir =3D conf.repos[name]['dest_dir']
-        if dest_dir !=3D ".":
-            filerange_root =3D '%s -x "%s/*"' % (filerange_root, dest_dir)
-
-    for name in conf.repos:
-        dest_dir =3D conf.repos[name]['dest_dir']
-        patch_filename =3D "%s/%s.patch" % (patchdir, name)
-        if dest_dir =3D=3D ".":
-            cmd =3D "git format-patch -n1 --stdout %s^..%s | filterdiff -p=
1 %s > %s" % (commit, commit, filerange_root, patch_filename)
-        else:
-            cmd =3D "git format-patch --no-prefix -n1 --stdout %s^..%s -- =
%s > %s" % (commit, commit, dest_dir, patch_filename)
-        runcmd(cmd)
-        # Detect empty patches (including those produced by filterdiff abo=
ve
-        # that contain only preamble text)
-        if os.path.getsize(patch_filename) =3D=3D 0 or runcmd("filterdiff =
%s" % patch_filename) =3D=3D "":
-            os.remove(patch_filename)
-            logger.info("(skipping %s - no changes)", name)
-        else:
-            logger.info(patch_filename)
-
-def update_with_history(conf, components, revisions, repos):
-    '''Update all components with full history.
-
-    Works by importing all commits reachable from a component's
-    current head revision.  If those commits are rooted in an already
-    imported commit, their content gets mixed with the content of the
-    combined repo of that commit (new or modified files overwritten,
-    removed files removed).
-
-    The last commit is an artificial merge commit that merges all the
-    updated components into the combined repository.
-
-    The HEAD ref only gets updated at the very end. All intermediate work
-    happens in a worktree which will get garbage collected by git eventual=
ly
-    after a failure.
-    '''
-    # Remember current HEAD and what we need to add to it.
-    head =3D runcmd("git rev-parse HEAD").strip()
-    additional_heads =3D {}
-
-    # Track the mapping between original commit and commit in the
-    # combined repo. We do not have to distinguish between components,
-    # because commit hashes are different anyway. Often we can
-    # skip find_revs() entirely (for example, when all new commits
-    # are derived from the last imported revision).
-    #
-    # Using "head" (typically the merge commit) instead of the actual
-    # commit for the component leads to a nicer history in the combined
-    # repo.
-    old2new_revs =3D {}
-    for name in repos:
-        repo =3D conf.repos[name]
-        revision =3D repo['last_revision']
-        if revision:
-            old2new_revs[revision] =3D head
-
-    def add_p(parents):
-        '''Insert -p before each entry.'''
-        parameters =3D []
-        for p in parents:
-            parameters.append('-p')
-            parameters.append(p)
-        return parameters
-
-    # Do all intermediate work with a separate work dir and index,
-    # chosen via env variables (can't use "git worktree", it is too
-    # new). This is useful (no changes to current work tree unless the
-    # update succeeds) and required (otherwise we end up temporarily
-    # removing the combo-layer hooks that we currently use when
-    # importing a new component).
-    #
-    # Not cleaned up after a failure at the moment.
-    wdir =3D os.path.join(os.getcwd(), ".git", "combo-layer")
-    windex =3D wdir + ".index"
-    if os.path.isdir(wdir):
-        shutil.rmtree(wdir)
-    os.mkdir(wdir)
-    wenv =3D copy.deepcopy(os.environ)
-    wenv["GIT_WORK_TREE"] =3D wdir
-    wenv["GIT_INDEX_FILE"] =3D windex
-    # This one turned out to be needed in practice.
-    wenv["GIT_OBJECT_DIRECTORY"] =3D os.path.join(os.getcwd(), ".git", "ob=
jects")
-    wargs =3D {"destdir": wdir, "env": wenv}
-
-    for name in repos:
-        revision =3D revisions.get(name, None)
-        repo =3D conf.repos[name]
-        ldir =3D repo['local_repo_dir']
-        dest_dir =3D repo['dest_dir']
-        branch =3D repo.get('branch', "master")
-        hook =3D repo.get('hook', None)
-        largs =3D {"destdir": ldir, "env": None}
-        file_include =3D repo.get('file_filter', '').split()
-        file_include.sort() # make sure that short entries like '.' come f=
irst.
-        file_exclude =3D repo.get('file_exclude', '').split()
-
-        def include_file(file):
-            if not file_include:
-                # No explicit filter set, include file.
-                return True
-            for filter in file_include:
-                if filter =3D=3D '.':
-                    # Another special case: include current directory and =
thus all files.
-                    return True
-                if os.path.commonprefix((filter, file)) =3D=3D filter:
-                    # Included in directory or direct file match.
-                    return True
-                # Check for wildcard match *with* allowing * to match /, i=
.e.
-                # src/*.c does match src/foobar/*.c. That's not how it is =
done elsewhere
-                # when passing the filtering to "git archive", but it is u=
nclear what
-                # the intended semantic is (the comment on file_exclude th=
at "append a * wildcard
-                # at the end" to match the full content of a directories i=
mplies that
-                # slashes are indeed not special), so here we simply do wh=
at's easy to
-                # implement in Python.
-                logger.debug('fnmatch(%s, %s)' % (file, filter))
-                if fnmatch.fnmatchcase(file, filter):
-                    return True
-            return False
-
-        def exclude_file(file):
-            for filter in file_exclude:
-                if fnmatch.fnmatchcase(file, filter):
-                    return True
-            return False
-
-        def file_filter(files):
-            '''Clean up file list so that only included files remain.'''
-            index =3D 0
-            while index < len(files):
-                file =3D files[index]
-                if not include_file(file) or exclude_file(file):
-                    del files[index]
-                else:
-                    index +=3D 1
-
-
-        # Generate the revision list.
-        logger.info("Analyzing commits from %s..." % name)
-        top_revision =3D revision or branch
-        if not check_rev_branch(name, ldir, top_revision, branch):
-            sys.exit(1)
-
-        last_revision =3D repo['last_revision']
-        rev_list_args =3D "--full-history --sparse --topo-order --reverse"
-        if not last_revision:
-            logger.info("Warning: last_revision of component %s is not set=
, starting from the first commit" % name)
-            rev_list_args =3D rev_list_args + ' ' + top_revision
-        else:
-            if not check_rev_branch(name, ldir, last_revision, branch):
-                sys.exit(1)
-            rev_list_args =3D "%s %s..%s" % (rev_list_args, last_revision,=
 top_revision)
-
-            # By definition, the current HEAD contains the latest imported
-            # commit of each component. We use that as initial mapping eve=
n
-            # though the commits do not match exactly because
-            # a) it always works (in contrast to find_revs, which relies o=
n special
-            #    commit messages)
-            # b) it is faster than find_revs, which will only be called on=
 demand
-            #    and can be skipped entirely in most cases
-            # c) last but not least, the combined history looks nicer when=
 all
-            #    new commits are rooted in the same merge commit
-            old2new_revs[last_revision] =3D head
-
-        # We care about all commits (--full-history and --sparse) and
-        # we want reconstruct the topology and thus do not care
-        # about ordering by time (--topo-order). We ask for the ones
-        # we need to import first to be listed first (--reverse).
-        revs =3D runcmd("git rev-list %s" % rev_list_args, **largs).split(=
)
-        logger.debug("To be imported: %s" % revs)
-        # Now 'revs' contains all revisions reachable from the top revisio=
n.
-        # All revisions derived from the 'last_revision' definitely are ne=
w,
-        # whereas the others may or may not have been imported before. For
-        # a linear history in the component, that second set will be empty=
.
-        # To distinguish between them, we also get the shorter list
-        # of revisions starting at the ancestor.
-        if last_revision:
-            ancestor_revs =3D runcmd("git rev-list --ancestry-path %s" % r=
ev_list_args, **largs).split()
-        else:
-            ancestor_revs =3D []
-        logger.debug("Ancestors: %s" % ancestor_revs)
-
-        # Now import each revision.
-        logger.info("Importing commits from %s..." % name)
-        def import_rev(rev):
-            global scanned_revs
-
-            # If it is part of the new commits, we definitely need
-            # to import it. Otherwise we need to check, we might have
-            # imported it before. If it was imported and we merely
-            # fail to find it because commit messages did not track
-            # the mapping, then we end up importing it again. So
-            # combined repos using "updating with history" really should
-            # enable the "From ... rev:" commit header modifications.
-            if rev not in ancestor_revs and rev not in old2new_revs and no=
t scanned_revs:
-                logger.debug("Revision %s triggers log analysis." % rev)
-                find_revs(old2new_revs, head)
-                scanned_revs =3D True
-            new_rev =3D old2new_revs.get(rev, None)
-            if new_rev:
-                return new_rev
-
-            # If the commit is not in the original list of revisions
-            # to be imported, then it must be a parent of one of those
-            # commits and it was skipped during earlier imports or not
-            # found. Importing such merge commits leads to very ugly
-            # history (long cascade of merge commits which all point
-            # to to older commits) when switching from "update via
-            # patches" to "update with history".
-            #
-            # We can avoid importing merge commits if all non-merge commit=
s
-            # reachable from it were already imported. In that case we
-            # can root the new commits in the current head revision.
-            def is_imported(prev):
-                parents =3D runcmd("git show --no-patch --pretty=3Dformat:=
%P " + prev, **largs).split()
-                if len(parents) > 1:
-                    for p in parents:
-                        if not is_imported(p):
-                            logger.debug("Must import %s because %s is not=
 imported." % (rev, p))
-                            return False
-                    return True
-                elif prev in old2new_revs:
-                    return True
-                else:
-                    logger.debug("Must import %s because %s is not importe=
d." % (rev, prev))
-                    return False
-            if rev not in revs and is_imported(rev):
-                old2new_revs[rev] =3D head
-                return head
-
-            # Need to import rev. Collect some information about it.
-            logger.debug("Importing %s" % rev)
-            (parents, author_name, author_email, author_timestamp, body) =
=3D \
-                runcmd("git show --no-patch --pretty=3Dformat:%P%x00%an%x0=
0%ae%x00%at%x00%B " + rev, **largs).split(chr(0))
-            parents =3D parents.split()
-            if parents:
-                # Arbitrarily pick the first parent as base. It may or may=
 not have
-                # been imported before. For example, if the parent is a me=
rge commit
-                # and previously the combined repository used patching as =
update
-                # method, then the actual merge commit parent never was im=
ported.
-                # To cover this, We recursively import parents.
-                parent =3D parents[0]
-                new_parent =3D import_rev(parent)
-                # Clean index and working tree. TODO: can we combine this =
and the
-                # next into one command with less file IO?
-                # "git reset --hard" does not work, it changes HEAD of the=
 parent
-                # repo, which we wanted to avoid. Probably need to keep
-                # track of the rev that corresponds to the index and use a=
pply_commit().
-                runcmd("git rm -q --ignore-unmatch -rf .", **wargs)
-                # Update index and working tree to match the parent.
-                runcmd("git checkout -q -f %s ." % new_parent, **wargs)
-            else:
-                parent =3D None
-                # Clean index and working tree.
-                runcmd("git rm -q --ignore-unmatch -rf .", **wargs)
-
-            # Modify index and working tree such that it mirrors the commi=
t.
-            apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=
=3Dfile_filter)
-
-            # Now commit.
-            new_tree =3D runcmd("git write-tree", **wargs).strip()
-            env =3D copy.deepcopy(wenv)
-            env['GIT_AUTHOR_NAME'] =3D author_name
-            env['GIT_AUTHOR_EMAIL'] =3D author_email
-            env['GIT_AUTHOR_DATE'] =3D author_timestamp
-            if hook:
-                # Need to turn the verbatim commit message into something =
resembling a patch header
-                # for the hook.
-                with tempfile.NamedTemporaryFile(mode=3D'wt', delete=3DFal=
se) as patch:
-                    patch.write('Subject: [PATCH] ')
-                    patch.write(body)
-                    patch.write('\n---\n')
-                    patch.close()
-                    runcmd([hook, patch.name, rev, name])
-                    with open(patch.name) as f:
-                        body =3D f.read()[len('Subject: [PATCH] '):][:-len=
('\n---\n')]
-
-            # We can skip non-merge commits that did not change any files.=
 Those are typically
-            # the result of file filtering, although they could also have =
been introduced
-            # intentionally upstream, in which case we drop some informati=
on here.
-            if len(parents) =3D=3D 1:
-                parent_rev =3D import_rev(parents[0])
-                old_tree =3D runcmd("git show -s --pretty=3Dformat:%T " + =
parent_rev, **wargs).strip()
-                commit =3D old_tree !=3D new_tree
-                if not commit:
-                    new_rev =3D parent_rev
-            else:
-                commit =3D True
-            if commit:
-                new_rev =3D runcmd("git commit-tree".split() + add_p([impo=
rt_rev(p) for p in parents]) +
-                                 ["-m", body, new_tree],
-                                 env=3Denv).strip()
-            old2new_revs[rev] =3D new_rev
-
-            return new_rev
-
-        if revs:
-            for rev in revs:
-                import_rev(rev)
-            # Remember how to update our current head. New components get =
added,
-            # updated components get the delta between current head and th=
e updated component
-            # applied.
-            additional_heads[old2new_revs[revs[-1]]] =3D head if repo['las=
t_revision'] else None
-            repo['last_revision'] =3D revs[-1]
-
-    # Now construct the final merge commit. We create the tree by
-    # starting with the head and applying the changes from each
-    # components imported head revision.
-    if additional_heads:
-        runcmd("git reset --hard", **wargs)
-        for rev, base in additional_heads.items():
-            apply_commit(base, rev, wargs, wargs, None)
-
-        # Commit with all component branches as parents as well as the pre=
vious head.
-        logger.info("Writing final merge commit...")
-        msg =3D conf_commit_msg(conf, components)
-        new_tree =3D runcmd("git write-tree", **wargs).strip()
-        new_rev =3D runcmd("git commit-tree".split() +
-                         add_p([head] + list(additional_heads.keys())) +
-                         ["-m", msg, new_tree],
-                         **wargs).strip()
-        # And done! This is the first time we change the HEAD in the actua=
l work tree.
-        runcmd("git reset --hard %s" % new_rev)
-
-        # Update and stage the (potentially modified)
-        # combo-layer.conf, but do not commit separately.
-        for name in repos:
-            repo =3D conf.repos[name]
-            rev =3D repo['last_revision']
-            conf.update(name, "last_revision", rev)
-        if commit_conf_file(conf, components, False):
-            # Must augment the previous commit.
-            runcmd("git commit --amend -C HEAD")
-
-
-scanned_revs =3D False
-def find_revs(old2new, head):
-    '''Construct mapping from original commit hash to commit hash in
-    combined repo by looking at the commit messages. Depends on the
-    "From ... rev: ..." convention.'''
-    logger.info("Analyzing log messages to find previously imported commit=
s...")
-    num_known =3D len(old2new)
-    log =3D runcmd("git log --grep=3D'From .* rev: [a-fA-F0-9][a-fA-F0-9]*=
' --pretty=3Dformat:%H%x00%B%x00 " + head).split(chr(0))
-    regex =3D re.compile(r'From .* rev: ([a-fA-F0-9]+)')
-    for new_rev, body in zip(*[iter(log)]* 2):
-        # Use the last one, in the unlikely case there are more than one.
-        rev =3D regex.findall(body)[-1]
-        if rev not in old2new:
-            old2new[rev] =3D new_rev.strip()
-    logger.info("Found %d additional commits, leading to: %s" % (len(old2n=
ew) - num_known, old2new))
-
-
-def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=3DNone):
-    '''Compare revision against parent, remove files deleted in the
-    commit, re-write new or modified ones. Moves them into dest_dir.
-    Optionally filters files.
-    '''
-    if not dest_dir:
-        dest_dir =3D "."
-    # -r recurses into sub-directories, given is the full overview of
-    # what changed.  We do not care about copy/edits or renames, so we
-    # can disable those with --no-renames (but we still parse them,
-    # because it was not clear from git documentation whether C and M
-    # lines can still occur).
-    logger.debug("Applying changes between %s and %s in %s" % (parent, rev=
, largs["destdir"]))
-    delete =3D []
-    update =3D []
-    if parent:
-        # Apply delta.
-        changes =3D runcmd("git diff-tree --no-commit-id --no-renames --na=
me-status -r --raw -z %s %s" % (parent, rev), **largs).split(chr(0))
-        for status, name in zip(*[iter(changes)]*2):
-            if status[0] in "ACMRT":
-                update.append(name)
-            elif status[0] in "D":
-                delete.append(name)
-            else:
-                logger.error("Unknown status %s of file %s in revision %s"=
 % (status, name, rev))
-                sys.exit(1)
-    else:
-        # Copy all files.
-        update.extend(runcmd("git ls-tree -r --name-only -z %s" % rev, **l=
args).split(chr(0)))
-
-    # Include/exclude files as define in the component config.
-    # Both updated and deleted file lists get filtered, because it might h=
appen
-    # that a file gets excluded, pulled from a different component, and th=
en the
-    # excluded file gets deleted. In that case we must keep the copy.
-    if file_filter:
-        file_filter(update)
-        file_filter(delete)
-
-    # We export into a tar archive here and extract with tar because it is=
 simple (no
-    # need to implement file and symlink writing ourselves) and gives us s=
ome degree
-    # of parallel IO. The downside is that we have to pass the list of fil=
es via
-    # command line parameters - hopefully there will never be too many at =
once.
-    if update:
-        target =3D os.path.join(wargs["destdir"], dest_dir)
-        if not os.path.isdir(target):
-            os.makedirs(target)
-        quoted_target =3D shlex.quote(target)
-        # os.sysconf('SC_ARG_MAX') is lying: running a command with
-        # string length 629343 already failed with "Argument list too
-        # long" although SC_ARG_MAX =3D 2097152. "man execve" explains
-        # the limitations, but those are pretty complicated. So here
-        # we just hard-code a fixed value which is more likely to work.
-        max_cmdsize =3D 64 * 1024
-        while update:
-            quoted_args =3D []
-            unquoted_args =3D []
-            cmdsize =3D 100 + len(quoted_target)
-            while update:
-                quoted_next =3D shlex.quote(update[0])
-                size_next =3D len(quoted_next) + len(dest_dir) + 1
-                logger.debug('cmdline length %d + %d < %d?' % (cmdsize, si=
ze_next, os.sysconf('SC_ARG_MAX')))
-                if cmdsize + size_next < max_cmdsize:
-                    quoted_args.append(quoted_next)
-                    unquoted_args.append(update.pop(0))
-                    cmdsize +=3D size_next
-                else:
-                    logger.debug('Breaking the cmdline at length %d' % cmd=
size)
-                    break
-            logger.debug('Final cmdline length %d / %d' % (cmdsize, os.sys=
conf('SC_ARG_MAX')))
-            cmd =3D "git archive %s %s | tar -C %s -xf -" % (rev, ' '.join=
(quoted_args), quoted_target)
-            logger.debug('First cmdline length %d' % len(cmd))
-            runcmd(cmd, **largs)
-            cmd =3D "git add -f".split() + [os.path.join(dest_dir, x) for =
x in unquoted_args]
-            logger.debug('Second cmdline length %d' % reduce(lambda x, y: =
x + len(y), cmd, 0))
-            runcmd(cmd, **wargs)
-    if delete:
-        for path in delete:
-            if dest_dir:
-                path =3D os.path.join(dest_dir, path)
-        runcmd("git rm -f --ignore-unmatch".split() + [os.path.join(dest_d=
ir, x) for x in delete], **wargs)
-
-def action_error(conf, args):
-    logger.info("invalid action %s" % args[0])
-
-actions =3D {
-    "init": action_init,
-    "update": action_update,
-    "pull": action_pull,
-    "splitpatch": action_splitpatch,
-    "sync-revs": action_sync_revs,
-}
-
-def main():
-    parser =3D optparse.OptionParser(
-        version =3D "Combo Layer Repo Tool version %s" % __version__,
-        usage =3D """%prog [options] action
-
-Create and update a combination layer repository from multiple component r=
epositories.
-
-Action:
-  init                   initialise the combo layer repo
-  update [components]    get patches from component repos and apply them t=
o the combo repo
-  pull [components]      just pull component repos only
-  sync-revs [components] update the config file's last_revision for each r=
epository
-  splitpatch [commit]    generate commit patch and split per component, de=
fault commit is HEAD""")
-
-    parser.add_option("-c", "--conf", help =3D "specify the config file (c=
onf/combo-layer.conf is the default).",
-               action =3D "store", dest =3D "conffile", default =3D "conf/=
combo-layer.conf")
-
-    parser.add_option("-i", "--interactive", help =3D "interactive mode, u=
ser can edit the patch list and patches",
-               action =3D "store_true", dest =3D "interactive", default =
=3D False)
-
-    parser.add_option("-D", "--debug", help =3D "output debug information"=
,
-               action =3D "store_true", dest =3D "debug", default =3D Fals=
e)
-
-    parser.add_option("-n", "--no-pull", help =3D "skip pulling component =
repos during update",
-               action =3D "store_true", dest =3D "nopull", default =3D Fal=
se)
-
-    parser.add_option("--hard-reset",
-               help =3D "instead of pull do fetch and hard-reset in compon=
ent repos",
-               action =3D "store_true", dest =3D "hard_reset", default =3D=
 False)
-
-    parser.add_option("-H", "--history", help =3D "import full history of =
components during init",
-                      action =3D "store_true", default =3D False)
-
-    options, args =3D parser.parse_args(sys.argv)
-
-    # Dispatch to action handler
-    if len(args) =3D=3D 1:
-        logger.error("No action specified, exiting")
-        parser.print_help()
-    elif args[1] not in actions:
-        logger.error("Unsupported action %s, exiting\n" % (args[1]))
-        parser.print_help()
-    elif not os.path.exists(options.conffile):
-        logger.error("No valid config file, exiting\n")
-        parser.print_help()
-    else:
-        if options.debug:
-            logger.setLevel(logging.DEBUG)
-        confdata =3D Configuration(options)
-        initmode =3D (args[1] =3D=3D 'init')
-        confdata.sanity_check(initmode)
-        actions.get(args[1], action_error)(confdata, args[1:])
-
-if __name__ =3D=3D "__main__":
-    try:
-        ret =3D main()
-    except Exception:
-        ret =3D 1
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook=
-default.sh
deleted file mode 100755
index fb9651b31f..0000000000
--- a/scripts/combo-layer-hook-default.sh
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Hook to add source component/revision info to commit message
-# Parameter:
-#   $1 patch-file
-#   $2 revision
-#   $3 reponame
-
-patchfile=3D$1
-rev=3D$2
-reponame=3D$3
-
-sed -i -e "0,/^Subject:/s#^Subject: \[PATCH\] \($reponame: \)*\(.*\)#Subje=
ct: \[PATCH\] $reponame: \2#" $patchfile
-if grep -q '^Signed-off-by:' $patchfile; then
-    # Insert before Signed-off-by.
-    sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\(From $reponame=
 rev: $rev\)\n\n\1#" $patchfile
-else
-    # Insert before final --- separator, with extra blank lines removed.
-    perl -e "\$_ =3D join('', <>); s/^(.*\S[ \t]*)(\n|\n\s*\n)---\n/\$1\n\=
nFrom $reponame rev: $rev\n---\n/s; print;" $patchfile >$patchfile.tmp
-    mv $patchfile.tmp $patchfile
-fi
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.ex=
ample
deleted file mode 100644
index 90e2b58723..0000000000
--- a/scripts/combo-layer.conf.example
+++ /dev/null
@@ -1,93 +0,0 @@
-# combo-layer example configuration file
-
-# Default values for all sections.
-[DEFAULT]
-
-# Add 'Signed-off-by' to all commits that get imported automatically.
-signoff =3D True
-
-# component name
-[bitbake]
-
-# Override signedoff default above (not very useful, but possible).
-signoff =3D False
-
-# mandatory options
-# git upstream uri
-src_uri =3D git://git.openembedded.org/bitbake
-
-# the directory to clone the component repo
-local_repo_dir =3D /home/kyu3/src/test/bitbake
-
-# the relative dir within the combo repo to put the component files
-# use "." if the files should be in the root dir
-dest_dir =3D bitbake
-
-# the last update revision.
-# "init" will set this to the latest revision automatically, however if it
-# is empty when "update" is run, the tool will start from the first commit=
.
-# Note that this value will get updated by "update" if the component repo'=
s
-# latest revision changed and the operation completes successfully.
-last_revision =3D
-
-# optional options:
-
-# branch: specify the branch in the component repo to pull from
-# (master if not specified)
-
-# file_filter: only include the specified file(s)
-# file_filter =3D [path] [path] ...
-# example:
-#   file_filter =3D src/  : only include the subdir src
-#   file_filter =3D src/*.c : only include the src *.c file
-#   file_filter =3D src/main.c src/Makefile.am : only include these two fi=
les
-
-# file_exclude: filter out these file(s)
-# file_exclude =3D [path] [path] ...
-#
-# Each entry must match a file name. In contrast do file_filter, matching
-# a directory has no effect. To achieve that, use append a * wildcard
-# at the end.
-#
-# Wildcards are applied to the complete path and also match slashes.
-#
-# example:
-#   file_exclude =3D src/foobar/*  : exclude everything under src/foobar
-#   file_exclude =3D src/main.c : filter out main.c after including it wit=
h file_filter =3D src/*.c
-#   file_exclude =3D *~ : exclude backup files
-
-# hook: if provided, the tool will call the hook to process the generated
-#     patch from upstream, and then apply the modified patch to the combo
-#     repo.
-# the hook script is called as follows: ./hook patchpath revision reponame
-# example:
-#     hook =3D combo-layer-hook-default.sh
-
-# since_revision:
-#   since_revision =3D release-1-2
-#   since_revision =3D 12345 abcdf
-#
-# If provided, truncate imported history during "combo-layer --history
-# init" at the specified revision(s).  More than one can be specified
-# to cut off multiple component branches.
-#
-# The specified commits themselves do not get imported. Instead, an
-# artificial commit with "unknown" author is created with a content
-# that matches the original commit.
-
-[oe-core]
-src_uri =3D git://git.openembedded.org/openembedded-core
-local_repo_dir =3D /home/kyu3/src/test/oecore
-dest_dir =3D .
-last_revision =3D
-since_revision =3D some-tag-or-commit-on-master-branch
-
-# It is also possible to embed python code in the config values. Similar
-# to bitbake it considers every value starting with @ to be a python
-# script.
-# e.g. local_repo_dir could easily be configured using an environment
-# variable:
-#
-# [bitbake]
-# local_repo_dir =3D @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
-#

