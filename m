Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4E0CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:36:31 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31466.1778837783378980676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=XnlELaHZ;
 spf=pass (domain: aspeedtech.com, ip: 40.107.75.139, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMjwcq5/aPNCxZMW6XAJXfk+a0XH01utax2o55qP/eFrQEOK1Y+P9NDnnWcWjzuP8mODOdo3pOTGhEUAsaEzVg1ddrFFSse5qADjTcZV7hyIVuCzzV4u1zrPS9+B6OdWfWdPXkz3ugElPhlVKlQ1SuAoeBvFZaiJAos427hTEV1bxs6TG/fxy6th9zZiS0c8ksiEAHzWmyQjXeGi7lMGWGY23Ns8XbfO9KwuWVQ9fLVjEz2wDAU7IAw+6Zv6mtCbZfKTTVPFlRv4non7VrYslYCP+4uvDhhg6tJlpDFgCfaGiTSKhRH0E5lr5gdJvIwr2XyMAz4jEHtmvaf2TOnZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYxRRwg1HC7aD5PKHVihFP/HrT8q/x+Z9Lt4pL22cg4=;
 b=IjbDcImF4q0/+tkTMXjnOGBKbeq4zidpbbHm+mKFbc0ESH2rnzhbSeH3v5MAMfj6IwQ2TQcw6ajZ0lK02ZCMTC2DrHmcdeyj/hDLDzIFjc5Keq6stCTXtoQVHFjz0k2pthtW395TipxY9PwhNEfIVazSR4IKMVmAm+kGpUVOpMQ+R7k9BXbTtad3Hr4E525iWuPvSdgpxE2tG2isJOcRNtM9rCLeU4/QXxuEM3AmwzP1f1KoBb5JCLF5fAUMOBAigTTA/k5Q/4KHnj8GkZSQFK5ekqCw0sFpAj9DBmJHT+ODQor0MXwDExUTlzZX5wD/d7AegOBQ6nHJkDpqnbbnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYxRRwg1HC7aD5PKHVihFP/HrT8q/x+Z9Lt4pL22cg4=;
 b=XnlELaHZn3IIzczpigtNU/H8hkv4SO7526OWVWfYe53fdrOT64iQ2eVlpbe3PYtN0czH4mnp79R6T+Bjks49jFR9dS8Pz54SSGHEgxIaFEQR+fjyQRR5jPtpoJQZdCFw2/7n4yAvf5ixQJqVnkam+dnHGQ2zYwBO0Abm3JYN2KKSGj/cC3xU0BSKytjQIGF+A6jDv0pcSYZLVKpOzrfERd8HHyqOyIkW0eQpxXmvOXPiH3KihKyoecFoy2pUvTAAhnTGEw6WA79KoHWdUcTeqUWmMs8KuvFRSMxFckRvZ4n73omZJvp4HoC5ezDOtUjgfzxfj+wCKUivpw9b0Qh65Q==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB5176.apcprd06.prod.outlook.com (2603:1096:101:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 09:36:18 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:36:18 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v1 1/2] externalsrc: Handle nested git repos from multiple
 SRC_URI entries
Thread-Topic: [PATCH v1 1/2] externalsrc: Handle nested git repos from
 multiple SRC_URI entries
Thread-Index: AQHc5E5IWG4WbSnYm0WaLzDNjO9OhQ==
Date: Fri, 15 May 2026 09:36:18 +0000
Message-ID: <20260515093615.126849-2-jamin_lin@aspeedtech.com>
References: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260515093615.126849-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB5176:EE_
x-ms-office365-filtering-correlation-id: 2380c589-3348-4408-2c37-08deb2656ad5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|38070700021|3023799003;
x-microsoft-antispam-message-info: 
 A7/OitlGRKdx/LAJLWK00HMXQR8WNQcvC5BeIUjgpOpCpgZ/cgGCSWGf87kh8zdII8iDDKje5+fGheWQAId2w0aFebUk8/YRebnJmz1+awz/EJjfNQh+7auu03p6aH7eX0L2XzSYRvt3wJhUzFMJtXK6rcNhdn6/IcpO/xbyYXnNQTo0aFlBmtJ824xVPhZSzd5ct3UJM7nRDCdtS50nKzNmlbbehguHKxsAARF2ZwltMEJqpPzKtM87NKbP9tUiHOXCQR0T2JcX09GicXUoAvUigJBBd/UwAsnX3ntdE0ib49soRqX0tj+7VSGskyd+G3LM447u+zlLd6mCNkTtipns29BHx8UWw24fDwU9ktMtcXmeueBkYuth7tAuQyyB80xVxmk726uCzX1VV4fZ9NJfSwNNZ7+BmJ/p1X+c52YnumZXFrFBzLK0xJ7AlmrDrZ5Ctyyixc2cudhdSTe3vlPRz5uFfju0eYe5AUAVduOfJLjEwRFIjiNDijbjK2VLjARkeCk5m9H8MCqabZgQdutPGltRF9MhklnCcgAHnJKluk1jhUMWmNm9WtRITPf/PXASwCvJ0HYpMwrHxVdT5rfWGoQ4LxhgeyBCBk02DyhLBmpLDxrlEgxpZVB0ac2eDDx0hk0kpG3m1l7h1MrlIHta14tqZyoGiBdI3G9BWw679uzudrmGtXy8owlKJwpQKv3+i0y1RFQd8P3KjJ0A0RAnSWGlc83siwCr6C8dmBjQBtMeT25FsaNMxXJF5EGN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(3023799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DQs4Ij6H2oLAPNxw8CWdKLGdxDMlezXizeMqtaIntVetEIqctXchZaedG5+v?=
 =?us-ascii?Q?CTrpMYdLI3GQB0yzcbc4A6Kg4j3CCco8IWRhaXlgcurgr4NVwUh3kWIYEOuB?=
 =?us-ascii?Q?Hn/KHutfh2A80rM6JS/3ldpDiUgG2S6Fi2YD37kRA2D3j7l7pekd0sNLL4MA?=
 =?us-ascii?Q?La8x9ngfFySKK2hfg9pSTWvpH+kZdQwVMk9KtSEnax2HuHPdTJO3BFj22aKI?=
 =?us-ascii?Q?PiROO4Yfeo2ZM0XFU5mKIL+c/Unr423aYaIWxCIfExMWlbspRftIATaZl1u5?=
 =?us-ascii?Q?bmqegt4AiO93GcEf5wMPSZ2kaTZ1dEOsCP2AV2oZ3JSAMuNWznxXE/A2NTV2?=
 =?us-ascii?Q?hqx9ngbTxeectT//P9JspHhd3Lm8DTlPiNprvMg7G+EmrvSpXyOybJrPWj5p?=
 =?us-ascii?Q?QPkvtqUBHs07mYQ3q/xbbxgpOgRs8HqNvzlEaIKGI7Cngs+UVZ1B7uIUf+x3?=
 =?us-ascii?Q?0XVUEDQWxadFFFJTYrwqi8Co/pzIgTtjjcrL1R4U44CfbUU/icy10M4mgieN?=
 =?us-ascii?Q?5saQir7XYc0XHv/SHsoz1GjRwRCZju2IMW58qtyfH03+gaeijLy1zJ2/4q+U?=
 =?us-ascii?Q?+aMIRSOcB9LSOhXXNt3pFvNl24/CVfx/tjxVUWSitnZN7uTus4cnn6+Nec76?=
 =?us-ascii?Q?nsAvPE6YGt9sQDIReCtMZVpxu1f6F6U8KRJYQzUk5QHpiQyTS5f/4U6WTf3b?=
 =?us-ascii?Q?DLjytR6SqAL560857kgZOrlD0AUJNFR/lmd0EOzrkpIDPB1r3GqVQ/JnrLnq?=
 =?us-ascii?Q?Hj+hMXis9wO7hKIiTCfh/Id7JyWt1CeC7Gw/0OJQiAmLwslInzloZwli0rQi?=
 =?us-ascii?Q?QHnNZB4OU6H+PyL40M65ZOiv9pycJiUFHC87KyqllBT5RSCbepIiYAYmrGAw?=
 =?us-ascii?Q?CdmIET6sl32AsNaO+X5+yDxtfOD6TIzjQy5r8NDk/KBEhhILbplxnCEXQ6o2?=
 =?us-ascii?Q?NckL8Ppe/myt0gWPrGotAoYal3cVypla6SgyORlNgFXHl8skQG208ahpHmqY?=
 =?us-ascii?Q?kwImGcg7jnbhzG+iZikltrQIdiKhbsJi6MNWIrBAYh/p7lqfdRtDec89mYDc?=
 =?us-ascii?Q?aGS0aVVFdhn1FmFGUbVAzwnT2XOVXLkFv+4QeoTIs798CG8USSMNkyuNDZu6?=
 =?us-ascii?Q?qbdyhPcwLNOre1z9kL1dBkP9xysJ5sotqYRfzDoWPuFRDyg+Bpk+TS5+pKON?=
 =?us-ascii?Q?p8+3EjVuzhBZDL8+VitzvhRS48DdT1v9fD/U00/KQrVVwmv4gMwBe2zqDi6F?=
 =?us-ascii?Q?AZNs0hUTdZx5z/mm8UGGEIVwETHZqaSXP7VSzPW6NSkvUu1jsnv20zTaugAV?=
 =?us-ascii?Q?adi8wSLoCBuLLMEzDCRUUlIEYF2zegIo3Nc9vzE4pqge63nHJ7Yhh76yQd4v?=
 =?us-ascii?Q?N1MoSVBRNfpqssVdkeYuNh3kt+qbsBZxA0mKrsxAcL2ZRNRqRtU7eJ4ddRaA?=
 =?us-ascii?Q?A4/h4WajBFxJOpHUWhHadsey7TLk/WxubO4W3XD2EC3cFIfv8BZZiZ01XgIq?=
 =?us-ascii?Q?InM8WDV3DDXOkNySlimwaBKv+YBPC1ICYlDJkQ9IkuliMJ1IJ07ci++Yb5D4?=
 =?us-ascii?Q?6hLuDwAphPz4rQWpCXaAMOjO4raC8MeWn5imGav+iWQG5uhht4ImK+8QSBy5?=
 =?us-ascii?Q?kL1NBKU4vLmS06B1L1+Ca3Ee8ZfFuVVEM20CmS3WFAutug6p0ZiFJGZHkMTu?=
 =?us-ascii?Q?mEmmw74oQ6E9gOAZYTQK1OGJpi7PWNy7a8n+AXXIMb8wTPPuuB80MgoTLgwW?=
 =?us-ascii?Q?hWY1Eky5MQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2380c589-3348-4408-2c37-08deb2656ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:36:18.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gcIwT1MyqS0AWsDr9CA9WZls19+72DWIoCKgMhbwcEPvOFVD0TR+InGbg+yXKa8O9CZEU4weNlomjuQ+OznbpUdqWSvoqZf1IODJGgRXcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237074

When a recipe uses multiple git SRC_URI entries with different=0A=
destsuffix values (e.g. Zephyr-based recipes with separate repos for=0A=
the kernel, modules, and application), each source is unpacked into a=0A=
subdirectory of EXTERNALSRC that retains its own .git directory.=0A=
=0A=
srctree_hash_files() calls 'git add -A .' at the EXTERNALSRC root,=0A=
which fails with exit code 128 when git encounters these unregistered=0A=
nested git repositories, halting the bitbake parse phase.=0A=
=0A=
Fix by scanning for nested git repos before the add. If any are found,=0A=
exclude them from the top-level 'git add' using pathspec magic=0A=
':(exclude)<path>' and hash each nested repo independently using a=0A=
temporary index. This ensures changes in any nested repo still trigger=0A=
do_compile/do_configure to re-run.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/classes/externalsrc.bbclass | 37 +++++++++++++++++++++++++++++++-=0A=
 1 file changed, 36 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class=0A=
index 902ff2604f..0dd57af668 100644=0A=
--- a/meta/classes/externalsrc.bbclass=0A=
+++ b/meta/classes/externalsrc.bbclass=0A=
@@ -234,8 +234,43 @@ def srctree_hash_files(d, srcdir=3DNone):=0A=
             # Update our custom index=0A=
             env =3D os.environ.copy()=0A=
             env['GIT_INDEX_FILE'] =3D tmp_index.name=0A=
-            subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_dir=
, env=3Denv)=0A=
+            # Find nested git repos created by multiple SRC_URI git entrie=
s with=0A=
+            # different destsuffix values. git add -A . exits 128 when it =
encounters=0A=
+            # these unregistered nested repos.=0A=
+            nested_git_dirs =3D []=0A=
+            for root, dirs, files in os.walk(s_dir):=0A=
+                if root =3D=3D s_dir:=0A=
+                    continue=0A=
+                if '.git' in dirs or '.git' in files:=0A=
+                    nested_git_dirs.append(root)=0A=
+                    dirs[:] =3D []  # don't recurse into nested repos=0A=
+            if nested_git_dirs:=0A=
+                excludes =3D [':(exclude)' + os.path.relpath(n, s_dir) for=
 n in nested_git_dirs]=0A=
+                subprocess.check_output(['git', 'add', '-A', '.'] + exclud=
es, cwd=3Ds_dir, env=3Denv)=0A=
+            else:=0A=
+                subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds=
_dir, env=3Denv)=0A=
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], cw=
d=3Ds_dir, env=3Denv).decode("utf-8")=0A=
+            # Hash each nested git repo separately so source changes there=
 still=0A=
+            # trigger do_compile/do_configure to re-run.=0A=
+            for nested in nested_git_dirs:=0A=
+                nested_git =3D os.path.join(nested, '.git')=0A=
+                if not os.path.isdir(nested_git):=0A=
+                    continue=0A=
+                with tempfile.NamedTemporaryFile(prefix=3D'oe-devtool-nest=
ed-index') as nested_tmp:=0A=
+                    nested_index =3D os.path.join(nested_git, 'index')=0A=
+                    if os.path.exists(nested_index):=0A=
+                        shutil.copyfile(nested_index, nested_tmp.name)=0A=
+                    nested_env =3D os.environ.copy()=0A=
+                    nested_env['GIT_INDEX_FILE'] =3D nested_tmp.name=0A=
+                    proc =3D subprocess.Popen(['git', 'add', '-A', '.'], c=
wd=3Dnested,=0A=
+                                           env=3Dnested_env, stdout=3Dsubp=
rocess.DEVNULL,=0A=
+                                           stderr=3Dsubprocess.DEVNULL)=0A=
+                    proc.communicate()=0A=
+                    proc =3D subprocess.Popen(['git', 'write-tree'], cwd=
=3Dnested,=0A=
+                                           env=3Dnested_env, stdout=3Dsubp=
rocess.PIPE,=0A=
+                                           stderr=3Dsubprocess.DEVNULL)=0A=
+                    stdout, _ =3D proc.communicate()=0A=
+                    git_sha1 +=3D stdout.decode("utf-8")=0A=
             if os.path.exists(os.path.join(s_dir, ".gitmodules")) and os.p=
ath.getsize(os.path.join(s_dir, ".gitmodules")) > 0:=0A=
                 submodule_helper =3D subprocess.check_output(["git", "conf=
ig", "--file", ".gitmodules", "--get-regexp", "path"], cwd=3Ds_dir, env=3De=
nv).decode("utf-8")=0A=
                 for line in submodule_helper.splitlines():=0A=
-- =0A=
2.43.0=0A=

