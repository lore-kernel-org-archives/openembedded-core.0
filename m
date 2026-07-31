Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16634C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:49 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=FZYWjeIi;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imOJTDv6h4SO+/orMVcYVFWdx9jDmOfNg0ktN3LIf38RFCVZqgzss+jRJt56IAAAlxV8gTd+bZOkpBc1nhz1P5M5tHgOLvWqs3G+zFAEEtBV8R7D5r/PHj9i4HiIkAttQonazYCSHtcSiE6QfuAX9UDzhYHpzqhhYZI83RVfri1QhWrF/FZ+ZG1XC9fiRmCPGaRkVOT7kR36PSb7Vqr2+xNnPO6WWdiDVrQW7XFYF64g3jfLPAhXNFZp5pC4uctIVkSuHhw6/gCgJ8JNMIazb1SDbr4+Q/he0blCL45kW+wX6QbkfbGgDKNoj20grcReRs0WRTs0ZhjlHS/zmqwx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY6iQXP+e3YsnoMSC/GRTy5D2+zf9JPLpJyl12d78Eg=;
 b=uRQPwtnPR0y32pzCcLF1xAA+4matG7pEiEcHmEbh+37AM6sQSVvEtkVNWev8OKpN8ylKG+QiKsgVHvbnHzpc4NgvoF4MSiaX2p8dEYG890wMPMxooZ7Gevmz9Eh0HBHbuKsIhFFHfjxqUFPRoFQ5U7org0jENjObOxYT/7jcyJBXsESIU0cJRQRdl/fjrkZ9ndSGwFjLww+aa6rIaditL04qpzWNeGqTnkj/Kj0o9n8OutSKWxiSUnA5YHtmscCHG7CeaxFujSMMbkFhmJVOqumFcfvNS4jJDi8jYWhpUuKhGv79iwcE5fBr6xPYiutmtka1UrE95deup7+Lx9bdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY6iQXP+e3YsnoMSC/GRTy5D2+zf9JPLpJyl12d78Eg=;
 b=FZYWjeIi8Qgwsmz8tPLOLKELuPe1UNTY8DI+d+bLqbX14a40B+kgcO9URADqOKPYl8ZzAa3EKo+/VnTLhWtytqFisyvKz3veOwS+TxaYE59ohfsuZcCVkwWjZkYtmUS2lbYibD80YJl5cIFkMS9zdNE0AGiU/rTXX9R/Y5nupZCxkPFk5WLo5ngJGeLRdx/K3UoIfGgYEr3KwKvJkGIF7+KrzE6s0d7G+OLniaof41iQv/rh52t5wH0CAct31ufn6/GkRmybW9rhfu89N5onM6LRsdB65VGdgzGFX/xaeQXFi/L6NkZs5BlthIEknGzK5xt+J0exNF96jD0nC/Uqxw==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:36 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:36 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 1/5] oe/patch: Skip commitIgnored when nothing is actually
 staged
Thread-Topic: [PATCH v4 1/5] oe/patch: Skip commitIgnored when nothing is
 actually staged
Thread-Index: AQHdIM6vWbfO175rC02B/a9fFTzGHg==
Date: Fri, 31 Jul 2026 09:26:36 +0000
Message-ID: <20260731092634.1127862-2-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5295:EE_
x-ms-office365-filtering-correlation-id: 84c1c68c-3a54-44f5-ca79-08deeee5d190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|5023799004|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 65d/KUqMPKwzq8vJbLIg3o8kZwwrbOENYBH4TyYmNSEBJBaeAjLOsjIKns7CKuOmSZVEmXIy2svvsXZzs0ZBv9wN9wmZz846RlT307EYrJfChnRTbjuCj+cnCuYwNZCHSlHwqGOSpFTA/pntyorJG3RNPtYT1C6wDk5IE9S4KPPL2ijusNYqiRus/hMV7yCMPdppI+OQ52QAGzC3+HqxynuYIL4PHNqXQDXJGINGi/dqZEMQy9orckTaaYBIrasisjetXpt5lCjBn1y4PpVJHT+ZjHYxctIeqGBcX7coK5InjZuRgK10aO2YkykkVInOFQQVRtIx3QHS7eI2f/H1sau9/DTBV2rcnGve438nqUIMCZkhM8ULbE31fLSdx+96hJb+XoG1WxF7WK7yVf5BydhhJa3f5uIhuypiYv3pcjyrthjp0yAOAA9pdxq/zUUopFj/uacpZwYmFFGpEhReebA5/cJL6ht0srKjL5/SFPvBCHKdsZvqsajguIaKqleobGuCcxx2xyKVGptAsnGxULfgMSvlMO6v4Xje2IQwmbJorZNg/wY7r84YeL6086dkUVd3eoSOY4j5RQVsZRG57NyA7gYVR4nFXRL7u35m/Itk+jTxUZh72uXQIrNT0ph4hzXNsTJhpPEZNPhRcZxbKnuxwQwZIzOWABW6js7KHeAYInCZxDdYjpbac1Vnade6viv0eNjhzEc4kgQLr6bejMjM9yo4p6/M+DBw6PzInfU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rruEF+mll878YSQ5R61v+nakHHZbE08Wi8h+YKN6098g438tse98+DHysEav?=
 =?us-ascii?Q?7dWPI7A4ZLojTC7Iakaow3c1dD27NCvr6Hirvu1xt/MbhCTo4yfUBOn23D9L?=
 =?us-ascii?Q?ugYBsf7yg6eneKY6KsdNKqKZHPRaWcRaMtYvjoSpjgAk1tGl05XMh75FpOCa?=
 =?us-ascii?Q?eFAoxMq2YErYLIqpL9smpKndFq7etRK5flbNXEw4LaCjeF2nGC6XffklhUzZ?=
 =?us-ascii?Q?ZpfA5PeMi8PHcmZtHvYiJO+brPtpLvB83HbaL8PkXJ46P8XxtBo4Edy1PHF2?=
 =?us-ascii?Q?Ys/Rv2SeiF54o+lzT/zPJfFBT2C48lLjwg0EhVpYWa48/uUHT2s8q1KRZ6y/?=
 =?us-ascii?Q?FGkRW3GhceNc6lKYIaKFochVHGCmUcaRCGsWvh29DRoEPzj9JY8XGtpubYz5?=
 =?us-ascii?Q?5ay3Wr6RibR4qDOzeIwcxavZmGOXdunq105CqajYCQ2MPHY+pq9aaSHESLCX?=
 =?us-ascii?Q?T6slgM6qYZ8j+Ct/9N4D+gjeGdPNpv5qHxGr+2YX7gK1U771uPhzezJioC7o?=
 =?us-ascii?Q?7hBj2ATiLdrFnrYiIWXqy1T25kDy9sjIDeCIdUXzy3NJKSkYgW3uqnIiuZ/i?=
 =?us-ascii?Q?erIM8J6zyQuxlg8TOG4sr6xkMRYRrB5vmKa8acFoizDWims9/AOdONzZqvOr?=
 =?us-ascii?Q?35rL9QZPbQH+IQGcBaMBj4vW0pL28HGwtBv7HOWpie47u2ryJqrvgzKXOweU?=
 =?us-ascii?Q?azrdE86KWZI0IISp7ijLgK95v5Uu17b8sTvrPah8RIsh2iDvd2pVIjBNnOz1?=
 =?us-ascii?Q?7Uh717aoGKzD4aJ+dkTn+SPu2a5BRQ9HLRVcb0mvGw6NWH52zkhnu7dQoxxD?=
 =?us-ascii?Q?ZFTz8CfZXlKkplm/kMLxyX4X1hRpjsMuMRrBUEk7hcMfh08bON49LX4ff9zA?=
 =?us-ascii?Q?vmFoEpPnZ8StwpLY/SoYo3qf4xha3aiSqhLKleELlLqy0zayCeUynC4jfzvX?=
 =?us-ascii?Q?y4rHyuyalDQ+v99ZjZCijSF482s2AssqfHnvmREryE5QbUrXVK5HUnbqcc34?=
 =?us-ascii?Q?iMiPzSno0MY7zyDmbXOe1ktgxLnWKYUME4k1j+GwLUzeJLa55+Fh8jOs7N4I?=
 =?us-ascii?Q?XQgjXZu689adR5cZNLX+4dDAkVUZtpWjLJ9hznVxSOVT2VPV1NnoKdFdztoV?=
 =?us-ascii?Q?f3uISmik+Ya/Vh4JHKvvyClCU7PqUCz5IN1c8Gor/MJRuZxEDrBaLiwBS1QE?=
 =?us-ascii?Q?zbyp4Xn2z+T6FJdNgIv7wCB4mClm1Zi5v47wKb0meFehcAo+W4tCQmzsXEN0?=
 =?us-ascii?Q?/Wh2Ax9cFmQBDk8/4Bh1A0tlTdAlxLryyLFvJXEOSX0K/5qCvM6eOA+L3Fwj?=
 =?us-ascii?Q?6CO+OmFTbhwEMlM3G4BUwTOlANQWxSW9p/h7TG97lvrwf25XJvlNdcD9iEMo?=
 =?us-ascii?Q?ZWNIyYLI9ZBl0yCf835tDXAhGofB8V8e/L8gZ205dxovCTjW+FVicpCP6y1J?=
 =?us-ascii?Q?zEkNHCg0iHVYcu22GdV13IyRib5Elbj/lDd9GLPRqcbCiouCLld1Z84/ZuVB?=
 =?us-ascii?Q?K2cBsRGz9EOLYbtw/8tcF7DOCT1xQfCCcCxM+cmQiaW4CKFEj1wId8s4n3bs?=
 =?us-ascii?Q?+m8sRPXsMqWvxZCe8pCJrH1c3HwX00dT78UMdpUVZshJh5B1WhBkkcyFabdm?=
 =?us-ascii?Q?B6XKTDB5Gn8vsIiJypcIYaA8KRmArpd73/Lr8eQVR0uurUTPdYZ5XZzn2Lvu?=
 =?us-ascii?Q?h0XjKNuTmBwMLm1nkZUkASuhAiryvGJ/tVbO8CD3ZmNqW1xmgrdR4/HxEh5+?=
 =?us-ascii?Q?wWMa3XW3ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	KAsQr2fxofDUYEvtPm22hOUCw1usCmE0ArGZeC8nSLkaUPvWWph3IbEFHOBpG4w4Ydo7ssVFwBEUjuaoxdIVXkWYDOu9O051347kqIJsUZxrLGyMaffeHpc80JfWwk1ljWoekhAyKuRvYh3EnfngXrSSTJ7pnbOxjUhdqwjvR0GfL0IkUdfJPbU4ihsbA5o0w+pykKf1k4obDfkddVxnX6DJcwWP/a4uLr/m/hcHJvjKx12Koe4J6I49CrG5vpkkoo1qTEywsQmsOiPBPwjwbK3HxRMz9rF1SrJao7MAYmjGGJERqS46oMZqZ6kXOJZALT3xdtCZeIqrvtxFD1xtLA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c1c68c-3a54-44f5-ca79-08deeee5d190
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:36.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UJ5SorkvB1UJNUsJab+iMqXkKPkXxE3+bwrmPBWxgeZT74UW71PEHpN3uqqiDMXXHEjpLK7YwDxbq90lyyw8mK12OFafGFIeUjx39ub7II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242413

patch.bbclass's patch_task_postfunc calls GitApplyTree.commitIgnored()=0A=
whenever 'git status --porcelain .' reports the source tree as dirty=0A=
after do_patch, to snapshot those changes into the devtool tracking=0A=
repo with 'git add' + 'git commit'.=0A=
=0A=
A path can be reported as dirty by git status purely because it is a=0A=
submodule (or an unregistered embedded git repo) that itself has=0A=
modified or untracked content - for example a recipe with multiple git=0A=
SRC_URI entries where one destsuffix places a repo inside another=0A=
repo's own working tree. The outer repo's tracked commit hash for that=0A=
submodule hasn't changed, so 'git add' has nothing new to stage for it,=0A=
and git refuses to fold the submodule's own dirty state into a plain=0A=
commit without it being resolved first:=0A=
=0A=
  $ git commit -m ... --no-verify --no-gpg-sign=0A=
  Changes not staged for commit:=0A=
    (commit or discard the untracked or modified content in submodules)=0A=
          modified:   level1 (modified content)=0A=
  no changes added to commit (use "git add" and/or "git commit -a")=0A=
=0A=
'git commit' then exits non-zero with nothing to commit, and=0A=
commitIgnored() propagates that failure straight up, taking the whole=0A=
do_patch task down with it.=0A=
=0A=
Fix by checking 'git diff --cached --name-only' after 'git add': if=0A=
nothing was actually staged, there is nothing meaningful to snapshot,=0A=
so skip the commit (and the note it would otherwise add) instead of=0A=
failing.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oe/patch.py | 12 ++++++++++++=0A=
 1 file changed, 12 insertions(+)=0A=
=0A=
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py=0A=
index 1d50e83ab7..944dde1e03 100644=0A=
--- a/meta/lib/oe/patch.py=0A=
+++ b/meta/lib/oe/patch.py=0A=
@@ -516,6 +516,18 @@ class GitApplyTree(PatchTree):=0A=
     def commitIgnored(subject, dir=3DNone, files=3DNone, d=3DNone):=0A=
         if files:=0A=
             runcmd(['git', 'add'] + files, dir)=0A=
+=0A=
+        # 'git add' can leave nothing actually staged even though the call=
er=0A=
+        # saw a dirty status: a path can show as modified purely because i=
t=0A=
+        # is a submodule/embedded git repository with modified or untracke=
d=0A=
+        # content of its own (e.g. a further nested git repo from another=
=0A=
+        # destsuffix SRC_URI entry) - git refuses to record that via a pla=
in=0A=
+        # 'git add'/'git commit' without resolving the submodule's own sta=
te,=0A=
+        # so the commit below would fail with "no changes added to commit"=
.=0A=
+        # Skip the commit if there is nothing actually staged.=0A=
+        if not runcmd(['git', 'diff', '--cached', '--name-only'], dir).str=
ip():=0A=
+            return=0A=
+=0A=
         cmd =3D ["git"]=0A=
         GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)=0A=
         cmd +=3D ["commit", "-m", subject, "--no-verify", "--no-gpg-sign"]=
=0A=
-- =0A=
2.43.0=0A=

