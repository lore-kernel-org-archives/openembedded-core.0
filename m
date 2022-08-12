Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D9CC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 09:40:05 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.62])
 by mx.groups.io with SMTP id smtpd.web08.8791.1660297197026957625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 02:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=YtuchTi6;
 spf=pass (domain: elektrobit.com, ip: 40.107.92.62,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MCzZoekR2OxGRhgXcyIsi7niuGhM6KVIffUaiGDeTHSJW2YUY+1hVHkdmIlXPKbjQZQ02SA1tDSHWjRfRDmlg/IAc4zn/+QzvAf+OsQNpCKLQ1/hJxaQclDJ4BQC1f+B0k5MsEW6cNl0jN/uvoMAi4niVmSLVYdA5zHntUf/AdQjmrsFhbDhitJjU5qfCkmnv6SzSnEHORwCnUXWvwRzScAgL/e8l74+c+7pjGdhBZ/KCKe02KBmTg1H7g3kVpRi9o8IwDsAIlavbSPK22PHMeheigzl6YrJ2CsIfCFTdeKyDG62M/0pTCfZCRoUhtq8o/sH2y4WX2xRnNLDS+8WXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D6xW+YNnbLU+q5HulX/OBhDSeo2fWEt4kzAX9HPIvI=;
 b=gRnBZlU9ekfkDONGY8QaG+po6hgZj4qM02jinD1bBoOS24YPsSShHBy3MqxFW+tEHOIaoGXIYr29azlf1oBC1J6cTgs4I5cr9Wlticem0PNge6SB4u+s+/hWJ+famdtzoHyAjAZtr0MtmmlkjV9MeI5ahp1kSnRK1eBVVH5p9Mr6UTibrgjSdjmunaOmD0RmZiDNJVXSzJqvhuozqL68DxuU7E7Xy/zhki5t1P4dlIYjzaNHaeQ+9P6q+oPp5dESfXRlmvuuytldkqDn6k9n2CFKJ/WFuY2mEuBc4LEUWYQwEuSFYvFiniSzw4kdYbkSR7pABkEjZz71rYaQ52cp+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D6xW+YNnbLU+q5HulX/OBhDSeo2fWEt4kzAX9HPIvI=;
 b=YtuchTi6/ipOjm5+RGUJNNNIgFg6b/fGshv9LngZTZizixQYOxTFlnbhtsoHa0RR+jtP0lnzQv9B1OInjvf5gIBFZjSMfZ2hqTVOtrP6sMX7JSEFuGbGxyDL3J0TRKoGP74UEAvAGswAC6IR74JFaOOfTqvwnCP79qaZQad4jm8=
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by DM4PR08MB8246.namprd08.prod.outlook.com (2603:10b6:8:45::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Fri, 12 Aug
 2022 09:39:53 +0000
Received: from MW2NAM12FT035.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::90) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Fri, 12 Aug 2022 09:39:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MW2NAM12FT035.mail.protection.outlook.com (10.13.181.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 09:39:53 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 02:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fkr/q49OMs3ZT+/tAbg0NDpVmuOU8lIo+Htdy/SyNWfpZsN6JOgkUA7oR/MBviYT571YOU6rDmvJd+jK3GRinxMkU+aWtbIlqGd/gUX0cPHR7qnQRsrz5p7z9JJ3f6rSAcPOGW9L1mupgD9KlOO2p0t5JQdkOcMss/H8CqD8QFzEm0aQKDfeaw6RHSBSKVtARrHHLlJ2c9TGhzsU9qA8sIUFoXOkEKytBaLZd/KNRnORE+nLVtG4Ld8dzxiVqTo6jAkQnL++TYDMfFQ1EpR+eFFHleZGgogz83hE4Q0Y8bp9HhCQ4vHd1wW1bRb/VGV2+JksBcIZ3jTRi0DK3VlZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9D6xW+YNnbLU+q5HulX/OBhDSeo2fWEt4kzAX9HPIvI=;
 b=SvBCDr/PRAY7oUueXQkvIZ4QRlsaCBx/y+J58cPuVFToaH6LGEKxcbSivYLJrn3hPAe4Pc7GUuu6RnijdviniqGCYmP9596jmlxo3385feXGLJPY+NMM9dfE4EhfqI/uOchDudIiBdmXinHuJJ4oyRXYx+5ryM5Psd913cEu5Tn1RnTaYB6JIMkrFFbaRhT8L4Om6e8Wmi5P63n7QnjpiJAit6QhllFn3AVsffVkjZqG80JGr3orB6PwQIt9HUksH36ENc0FSzcqReTCUsZtA5GGokY1guqVeXP7Zbx5EfZd6vE0/pqPpnDKBzg5Ctarz9DmIrvpggBQoHx8grL98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9D6xW+YNnbLU+q5HulX/OBhDSeo2fWEt4kzAX9HPIvI=;
 b=YtuchTi6/ipOjm5+RGUJNNNIgFg6b/fGshv9LngZTZizixQYOxTFlnbhtsoHa0RR+jtP0lnzQv9B1OInjvf5gIBFZjSMfZ2hqTVOtrP6sMX7JSEFuGbGxyDL3J0TRKoGP74UEAvAGswAC6IR74JFaOOfTqvwnCP79qaZQad4jm8=
Received: from BN8PR16CA0034.namprd16.prod.outlook.com (2603:10b6:408:4c::47)
 by BYAPR08MB5911.namprd08.prod.outlook.com (2603:10b6:a03:11e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 09:39:34 +0000
Received: from BN8NAM12FT089.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::39) by BN8PR16CA0034.outlook.office365.com
 (2603:10b6:408:4c::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19 via Frontend
 Transport; Fri, 12 Aug 2022 09:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT089.mail.protection.outlook.com (10.13.183.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 09:39:33 +0000
Received: from denue6es010.ebgroup.elektrobit.com (10.243.160.100) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Fri, 12 Aug 2022 11:39:28 +0200
Received: from DEL01461.ebgroup.elektrobit.com.ebgroup.elektrobit.com
 (10.243.2.163) by denue6es010.ebgroup.elektrobit.com (10.243.160.100) with
 Microsoft SMTP Server id 15.1.2507.9 via Frontend Transport; Fri, 12 Aug 2022
 11:39:28 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, Kai Tomerius
	<kai.tomerius@elektrobit.com>
Subject: [PATCH v3] json-c: Add ptest for json-c
Date: Fri, 12 Aug 2022 11:39:24 +0200
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: 
 <f8cfddaf-636d-45d7-85bf-4b1fe2d73f85@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0612c3d4-1484-4bdb-fc1d-08da7c469c03
X-MS-TrafficTypeDiagnostic: 
	BYAPR08MB5911:EE_|MW2NAM12FT035:EE_|DM4PR08MB8246:EE_
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 z6sD9n3ciQs4Qj9Y57Nf8ajw7uceZlwn8oMPQZ7npN725YYqD1PUoKy/dBcXlr2UhtY/bXiVPseM6CjMC/2KYILb36q0nd1P1HUKKwaqLvNGMqGqgAAYSWKzOWyTIpf4jabXK8ByIahulemQHApX/vK3FZ+4pvDhHYMfX1XKK8YwqojZDZ3cE5OwdUulRN6eZYuNgytBLKQ3tGaA1VENUGCOZRKi1aldZ1rRG9/7NyA1kxrfWZUJxu8flWrj+PfUIUk0NNBSiyTRzC39hlrKLKCZUs9+Kce/4f+HmrIbIbQS5g8L830/V0SUo2Glppx23qtmq+mpib4QwklTQKlpu4UicNU4VP87n0L/E92MoISJ14+ZR6EVx316OWbOcvkn4YVV4cLfnf24p1AEgAZvI/7WwQX1n7AGA3INZKjEihPgi1rTrk8q64pl5O1YjXPGd1w2JF7UBdLLroYmn3NV91uqxLtZD73kYEMrh4i8G4jotBSDXDGF7wR3pat0Pjjg7wkpMUEiu7QtvM9suRQkYsMjRUyk9UXo+Er/JJXBdGCWZPKrbw3w5TGIS9FdIQ/G4jJZM/peag/djPkdEC3RfZDvjNUs6OrgfJ7T93P/fg8oyMsQBY1xDangoB3Mo1h67AA0XJM/B8d7+6zn4pMjyQXCaFv36ypvJm8ymJuddIESv6vj9P3AN60kD8RgVIB6OYxgc0//C9V4nI9W3qbpb3GBvwfSr57UjqbNLuwSbnDlSLY3RX/Gq9A3MYRu2AfxTREyyODg+dnqCm5NX+4mbUKzbUmKYxxO40zPvLVZUgnrlOvWTP2O9bmj+cTUe0QRk0CY2XOivwwlmkgqIp8k3w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(36840700001)(40470700004)(46966006)(426003)(83380400001)(336012)(478600001)(31696002)(5660300002)(107886003)(47076005)(31686004)(186003)(36860700001)(86362001)(40480700001)(6916009)(54906003)(40460700003)(8936002)(966005)(316002)(41300700001)(356005)(81166007)(82310400005)(6666004)(44832011)(82740400003)(70206006)(70586007)(2906002)(26005)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
 tZUogEjRJyCQ8juERD7bO11GCxu355ykdch283bhOdP+R6Q4w8GHUzhCyr6Zftlz1zWvaDm4gi9tH9wGcDVN6GPf8f46TK7azXmxuHMhRkWeyihw5ICbbLk8vYOR8qvEkphADN1+Nqe0pmJE4Y4MpJM6G240vQ19gWuQcWRmdSs0M4dRhWr/KGr5+0x7cQ4L9PmCFEpxqltbSBev+GYkZb81zBogZnMwRUe9XKg5POIrdh062hvWq5VmJ0CCQ62W7SkiEgUp373NZAvDqL2PzVYzUQ4QFB+nnkbhAv1jGC2cnZ0ALglLZBsIj9HJ1HBxZg3wz1+SFWuHYv99zhEi1GL0/VNstBQjkBRx2xLaAQ/1+7pI7yOQJS6S4nhzgebPMZVvBkLjDbzl518A0tN5hhOOrBlI2/mNNdbxctbZu40q6Zsw/cRaTocE5c3i9GgtH/VTD+fuZmRti1Q1BDJntaguwxT3rMfnmFTruhz+7Py29Lk/gnpazzGN7A7Dn4QSSUIijbyq2vOgx+M1+ZP+ksKCOQNNQ3Xn9CmnvdChicF/5v0e+/RSxCegDY5DVEK+8LE5PGqVUSttzvpxCL98QlyBkmmqmW7K621Aw3jEYsGIj5T401r17TT0SPtpy+7iETsEbb/x/WvH/Ci1v6i0z5MFaW/9mbO72QyJSEExwIhv5T9DG4nDdhgeRDFAnr9lU0zVkF2y3q6q/0rB2eziLZbELSvVP6XKCjPVMaEAZ6BJg2XAYR4tzX4AhPAWXh0gvouQ5MHibe/qY8VnT3R2KC31K7JIIRJDwHHnBxeeXFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5911
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MW2NAM12FT035.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b49dc05-3efc-43e0-dfeb-08da7c46903f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+UYzAZr0vCBrdA6LgoZ0OZKBWM/f75VOlevxGwOgB+VlqIa5Y1ZrqjR4FKw5cRhCCrwVRMs70sK74LgoKiFAFHoK5n1+mTuUA5LFTnQUhz7cqZ6B0Yyofj/kKn5TfwJy0hNii4CsDY1JKNovHnc2PLamHkSBUvGgUuHnouVErkLIkbp2jxxgAASlv/TVfeZsQx0m7w15Q3vOoqQCtdS+S12FKS0V5PG08q2Saj3BxsrcblQMkzr683jR5tDslAaie8t6acTKEKazrP81ciQHacaeWBf87qbLFFJCFDLPKTbJUgLskUEvpIKC8wBS8VLAilb69WJIW8WPNu5fb38Xg72DCzvMM7YzbyMWIFbmy7hS8SAmHZB4VMtI1fZPyVf7mHXVh+kJYoQ7IJqBljGCgyuSPAQDPdVxsgKPln/qm3lwA5xOUimOI2cTE9Y3qNQyKqAuAL42xZWkijlOHEBFBED51a87WOBLac98BtwJ4EWQXGewhKkncgdQ/gmclHakvUrZvOoSv5f4nACgypdhhcHPn84ebEHeZkqkxMf3RT3mKOjmGDFrXyY7ESbIKY+7QXFe2puamxDWwbjhvkbbJ+KAITqIP1WbnxXpHt9ZTL8K4NBaDv7sHZJAy44G7P25PKMf9fK2/688PfJvsiRNPVV02zve4zyluGewU2XxMtU5sMJQ4ekuN9m9Bos2dt3959sGq1V5pck6jYGt3TcTIjSYCuaNzfysfcpSZHWah+g2sjxmN6bcoDjq5PMCa09JXJbwqQ3JrEoqoJOK6i8fwK68SpB4z/1hhLtfUBwjm74aTamEFpzf1Lq4E3J4vqZT7XgNk+LmodRalsxTvymLvqg4TzJROD0bfFoJiFWrvF4=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39850400004)(36840700001)(40470700004)(46966006)(426003)(6666004)(336012)(47076005)(107886003)(70586007)(86362001)(31696002)(83380400001)(82740400003)(40460700003)(186003)(36860700001)(54906003)(5660300002)(4326008)(6916009)(82310400005)(31686004)(40480700001)(8676002)(8936002)(316002)(26005)(2906002)(70206006)(966005)(478600001)(44832011)(81166007)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 09:39:53.2783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0612c3d4-1484-4bdb-fc1d-08da7c469c03
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM12FT035.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 09:40:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169276

Adapt json-c recipe to compile and deploy a ptest for json-c.
Also add a small script for executing the tests.
All tests were successful on a trial and took around 20 seconds.

Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/json-c/json-c/run-ptest | 20 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.16.bb   | 16 +++++++++++++--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 6c4339e3e1..56088e4e66 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -22,6 +22,7 @@ PTESTS_FAST =3D "\
     gettext-ptest \
     glib-networking-ptest \
     gzip-ptest \
+    json-c-ptest \
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-d=
evtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..9ee6095ea2
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# This script is used to run json-c test suites
+cd tests
+
+ret_val=3D0
+for i in test*.test; do
+    # test_basic is not an own testcase, just
+    # contains common code of other tests
+    if [ "$i" !=3D "test_basic.test" ]; then
+        if ./$i > json-c_test.log 2>&1 ; then
+            echo PASS: $i
+        else
+            ret_val=3D1
+            echo FAIL: $i
+        fi
+    fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-dev=
tools/json-c/json-c_0.16.bb
index fdec5ec9af..50431081bb 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f=
2"
=20
-SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.g=
z"
+SRC_URI =3D " \
+    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://run-ptest \
+"
=20
 SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030=
c5ba8a0288d96b"
=20
@@ -13,6 +16,15 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\=
d+"
=20
 RPROVIDES:${PN} =3D "libjson"
=20
-inherit cmake
+inherit cmake ptest
+
+do_install_ptest() {
+    install -d ${D}/${PTEST_PATH}/tests
+    install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
+    install ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


