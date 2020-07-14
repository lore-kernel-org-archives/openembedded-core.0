Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web11.10594.1594688304164148593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 17:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hj6eSHcs;
 spf=pass (domain: windriver.com, ip: 40.107.220.42, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgrdKJusMr08rrgEo+RQiWJJzo8fSlAoo+17n257EK/DIDUBjUlguFg2a3mmDTVL0baKtGxjou1JUEZ2DrvvrB9ubg8+mxbfuYW2X1qrRfviDSKuXbCEEPnlWlKY0jO8sdvvoGePJ5yIFuzrYcqc8k7m24HSTGLPlDqP2Lxeju/KS/5GWbX8/z2c2du/YQsO70+VpgYeQhUGOugMKt7OHlTyBbvKa2/2HlcQin3tKpA8OjhP65VSmTp5yqKv9e5nxqu0jAwKq/t4tBeSIZRLYN/bGyKRKzWU0fgddI0lUKIElhjkHiShbXfiwb2s68I+4BIupMHxRxUMFBnMZ/OG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ap4bFqp9CnuMntvCIjCyXp2qDe+rXmgIyOF5v3++i0=;
 b=AY5+0dvipa6r50Kvvk9jbHUGpqXMdcT0M6UTmSXg2kswRhO6vrteIYVPEX6gnZcLcmfH9mE75cR65YisH8JRW1U3Y98MwtVTHvt4o+AJDwnot/KweofT76J6VrX8DNxU69A/KCiL8CBywxwJscngMcZzEDmmc8QRqqXuLIVqU6XJjUiLy+r27ivCZAdU2Nsanqc5uS9kHUsDRoIwpyTc0xh2i+hFjLD5wYvaGTpcNaYXKyIFbaLc+8oqYc3FBvQd7MfEUBomJQSzsERJyAbImHlHv9HgFrxP46MJoOrMZIQjbsH9FHey7eCpanHBdA/xq6ay+/2+l0Le9ldd87klxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ap4bFqp9CnuMntvCIjCyXp2qDe+rXmgIyOF5v3++i0=;
 b=hj6eSHcsV6u4Z+MbfLVxCOIItPu/iCaLb/Z5jMF1Thyka/iZOXHX56PXoQfwstl9gmPb5npoTOhV/PK4LYXUhPCCG982WTeuQEJUSWCBDoXDMqgzh1m6lztM5PMrd+ihksCcbgewwCZzwkfdcOFL8La4cxm+de8ZTjIArRAmFFM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM6PR11MB2555.namprd11.prod.outlook.com (2603:10b6:5:c5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Tue, 14 Jul
 2020 00:58:23 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 00:58:23 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] wic/filemap: Drop the unused block_is_unmapped()
Date: Tue, 14 Jul 2020 08:53:21 +0800
Message-ID: <20200714005323.15819-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714005323.15819-1-kexin.hao@windriver.com>
References: <20200714005323.15819-1-kexin.hao@windriver.com>
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 00:58:22 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0db94f5f-c2f2-4332-8651-08d82791020b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB255532898F6B18C811457F24E2610@DM6PR11MB2555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/mr+dpYCmNNJAvYj9pQB8Q4BR0rCq64E6v9+Xd+4LLao1HZdYw5Pr6nioqH4BP+VhA4inhqhnT622YbuLZU6g3MR2MLtqDZ17x0g5Z7rQUVO7QVwAUdlkqRdl2DNxv/Y6lDfCDeJxSg313AX8d8SjZy5PS90BWbg6IfN/xb7/5UgtES9iu3nCQ2VQvVt0i8mm6ji7pHTICekxSlAbqxUPNYo/aMHKLGbA9KAKxAjpY9yFIfFVke2PE0U0TrwmvJUvf/oqXejDTPr/BbnAOBkpokNZ+9y71cLq40OY/WTE+neJR7aYu+UlQi2m5Ex2biw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4314.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(366004)(346002)(136003)(396003)(1076003)(6512007)(26005)(186003)(16526019)(316002)(8936002)(86362001)(5660300002)(8676002)(83380400001)(6916009)(66556008)(66476007)(66946007)(478600001)(36756003)(6486002)(52116002)(956004)(2616005)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FkR1CxOKWITi6W1ok1SoSoqw9bv2rPFd85X5GbqJCkSn81tnrUjtNv9gC+MZO8DngeCuQSPJgZwMRNG48J29qMtS+T/jOSRMDFNg460TBBTG7jlQy6Yb+/+nCPA/0hhUo5JniFanBPSzgZaddQogm8Eq3mQadv4/4Dxhs5NtInOAP6T/TGKKFcTwNpUBASUWaQTTET4hoBZ0VApQLqD6JqUQbLpN+9dsQtsQKzY2Z0htt2788czIuyELS+LfToKolOYx4w0Y1e9iW+D1RSCAtBNe3Ct9OhQiHqfqtZ7r4rxcU+q4fWfIJbhio653G3fpCAV3LbcC1Yegiw3GZzj+b29lrMx5SVIakRx0Px/VI8D5JEzT9c6dAbMibyeJRlATVI+yiERNncgjUppT8FTLF/SVXjX2tN49TglcmGqJOhQZnBVL8Q/QBbLJkjTPv4/W/o2q040d2tREsUgxpeT0nL4G9c/F/K55vXxINnzZMww=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db94f5f-c2f2-4332-8651-08d82791020b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 00:58:23.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNmkcamYWGiF6zI/vemJf3b252lt3E2CtTyaXIbzuntlBe7jBf6PRqo7NilskDlhcxWn7vm1JRuUhvl+M0w/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2555
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This method is not used by any code, so drop it.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/filemap.py | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index c53147c2f18e..8cfed5afa80d 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -142,15 +142,6 @@ class _FilemapBase(object):
=20
         raise Error("the method is not implemented")
=20
-    def block_is_unmapped(self, block): # pylint: disable=3DW0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is not mapped (ho=
le)
-        and 'False' otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
     def get_mapped_ranges(self, start, count): # pylint: disable=3DW0613,R=
0201
         """
         This method has has to be implemented by child classes. This is a
@@ -265,10 +256,6 @@ class FilemapSeek(_FilemapBase):
                         % (block, result))
         return result
=20
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
     def _get_ranges(self, start, count, whence1, whence2):
         """
         This function implements 'get_mapped_ranges()' and
@@ -422,10 +409,6 @@ class FilemapFiemap(_FilemapBase):
                         % (block, result))
         return result
=20
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
     def _unpack_fiemap_extent(self, index):
         """
         Unpack a 'struct fiemap_extent' structure object number 'index' fr=
om
--=20
2.26.2

