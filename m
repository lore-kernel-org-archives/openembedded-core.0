Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979B2C0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 06:54:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web10.8582.1691045648178278145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 23:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=P4SmNjfC;
 dkim=fail reason="dkim: body hash did not verify" header.i=@topic.nl header.s=selector2 header.b=qCu/EhSn;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.71, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAqXtF5lEgKMNvqiyA4UhY4x0NxQH4Psjss9lSgVwn0=;
 b=P4SmNjfCHd2Wox7HnWuvUY2iRjtbT+JLXl9Kv5xXQ/NVS41aUjlBHZNrB/XW7r8l7wbuTLwDqqD8kZEPLS0DvzDm07mU087RM9dxIesWdeJ+i/rSeUr33Xd7spByZho9sJUdMSFipXe87Z1CqZtk/fUXjWv1PoV82XfLvcFSc/e7wz32imQbz1dndnm/HLtM9zEbLIlzSastLo5M7aS/SGfntGsXOE1AyGSw0ZQe6MTGq8be2RNA7rRhk0B8cyUZL7k9UA6QmMP8RD9CHZ3cwzyPekZVtgRfEkl2XTbliprSK9B/8AyjiRLwYZvPCk8oCq0DUj6lqtLxeaN63nd/6Q==
Received: from DUZPR01CA0127.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::13) by AS5PR04MB10000.eurprd04.prod.outlook.com
 (2603:10a6:20b:682::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 06:54:04 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::1a) by DUZPR01CA0127.outlook.office365.com
 (2603:10a6:10:4bc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Thu, 3 Aug 2023 06:54:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topicproducts.com; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; client-ip=20.93.157.195;
 helo=westeu11-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.20 via Frontend Transport; Thu, 3 Aug 2023 06:54:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.58) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 03 Aug 2023 06:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6SnlSDiqy5wkELkOZungAw9WlXHE/zQIZEhwLgCEEgBXdny2JMmfYSbeK+o2JvxufBDacMIOefXGkqRwr69pmTuVzOK3OWdyckWUKkwcSkVlEaiq5lItxuDmeh0/BR/FxVdG5b8anjf6dC2LZSYDjT0flZtCcoUbL5msz16jbCGxtlULyvx5DAKjhwGo4ELkdc6VSHzyvZDVRADZRApS8Y7/y0vcGhZ1zFr9nUmN5eDkh+0lC+07xTfwcJYXRr4HeCDtdz2vITrv1YH1EWiLEpuu1VQw3Pg6scMbAXoKVDsAa06pg8j6tqioQ4fw2PPnVCVdUnYh00wfnoPTDHEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2DADikUTpe9LSjiakr66WwQwoUwMK0qnkEJ417yIew=;
 b=cQl0cUi1RoeuShS6ODcvMGYi393g2eWSP3mbfLRLgd/kJ/tSq6k/tX7UOu4Qk28+CoXfqSH4dt8AfpF3JPVskcQvrHf6UVeR0BovFUMNeSVqrByc3xfYu+JMLUyM77YEGgmHE/eDt0vCc5EYFOXNgOqB8lyjL5teACei7AZMrDaNBfxRjY4K52+Knl+VT/K09qbWpHzV4gmTR4HzqESmk56WdP6EzflrIG72JFkNQxwL9Vln7kXsaCOXTEnMaan7k2A1JhFEIygJIlUgPdGSrMAV+C9/U+5Lc9OL0pxLQTAdgomCZ6pLOmcT4iz1OVbkbV524rhCBfBv560pY78jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2DADikUTpe9LSjiakr66WwQwoUwMK0qnkEJ417yIew=;
 b=qCu/EhSniyBobNfFP1AD0qmAPn4/WqWEJ/3b9RfqxDbZr0TipZINIQqgFlNh8/oFzcz9OlzL2HwmsAxGQ2gyFw0zDkkpNnIgMh5DkeofnhV9OQ2H6gLeXsiS57Y0yISIRBhLREMcD5wYV9O4aAMS87dllC9ocOV0VtKfOFqmtMPlftmY47n5NVW29GtaXksR6Os2r4Iyex4J/HL38SPAPqhkN4ofrpnHboDDP63JZq/SAWRZ75ycj3PV/7Hz+DifYHMJAHH2dmxxWGjA1POh7WgPQWB05TXM5TptReTTPy2Vt46m/zc3cejgbSVzZA8C9dcpLLomMK4Aj9fHiJXd9A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM6PR04MB6520.eurprd04.prod.outlook.com (2603:10a6:20b:f7::16)
 by AS4PR04MB9267.eurprd04.prod.outlook.com (2603:10a6:20b:4e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 06:54:01 +0000
Received: from AM6PR04MB6520.eurprd04.prod.outlook.com
 ([fe80::a5fe:7f33:6ccd:9599]) by AM6PR04MB6520.eurprd04.prod.outlook.com
 ([fe80::a5fe:7f33:6ccd:9599%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:54:01 +0000
Message-ID: <908f19c2-e434-f47e-232c-cfd41c824bf9@topic.nl>
Date: Thu, 3 Aug 2023 08:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: openembedded-core@lists.openembedded.org
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Removing debug-tweaks removes /etc/shadow
Organization: TOPIC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0122.eurprd04.prod.outlook.com
 (2603:10a6:208:55::27) To AM6PR04MB6520.eurprd04.prod.outlook.com
 (2603:10a6:20b:f7::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM6PR04MB6520:EE_|AS4PR04MB9267:EE_|DU2PEPF0001E9C1:EE_|AS5PR04MB10000:EE_
X-MS-Office365-Filtering-Correlation-Id: c2118e48-97b1-479b-0c2d-08db93ee6cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +mFuSaS+/LurxECmLsU1YwDqVlz2SNRjoPIMgj8ZQCul+nvyHcZU3H7nwzCZfkiPcyNv5ilnqX1ogvY7T7iZFwvwSvjS340FfWQIu5/kgx0Idw9TubZYt2fAIIBaiXywcywqv31u1DtXBY1Dvp/xvDb/VrcTBB5qk60Sz10ISYKGEKKItNxvaxnaGR1E67EdAPKxOFeSnDjWwbkEpeySLO6cl8I3JRkYYNuHTG+at1T2t1TCMosUT/rpqBXInGg9Wt6e61pEnt1S3cGd8R2OYpL4fi9oxJpMu8cT4+n9ewOCNWQifQLWl89K47Udlmhxgg37HM37iEGN8F6Go7u8dVXWtg2/HvcpGtUkd7UvxZpUKAkrGjnVuop+nwi2sR4VlQYDZzWsBDlWabPaC+WLLMuMN3A5iZ1nXqWLydqehR5K0sV0CpMz2G2YstR6lNAvyMQWRxPa7qG/vMjho99EYzCi7hxCAV4kt+ngAeI/6MN2oSZKnwSxNu4Fg3vrc8EWtsZYbtWoQAZ0d0M401eXGeWPGLrGqCqxEGGt2dC4hhNUKyZTfGm1fY/99ovIalGU2GJKhqOQs1Z6H1k8MXTpMEDpP2h42CxWqT0iCNdQXAmLMCdxrTfcZlukwAjFdv+31B24uP+kKIWE65hBbDvRLg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6520.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39840400004)(451199021)(42882007)(2616005)(6506007)(26005)(186003)(83380400001)(316002)(2906002)(66946007)(6916009)(66476007)(66556008)(5660300002)(44832011)(41300700001)(8676002)(8936002)(6486002)(6512007)(36916002)(478600001)(38100700002)(83170400001)(15974865002)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9267
X-CodeTwo-MessageID: e6b101cb-9066-4360-be64-0c09c8c2c24a.20230803065403@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e25b80d2-6294-4c98-a5fc-08db93ee6ae1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEv5apIqZnoRYN/ufVB3lzVAdspz/jxmUFXBFDKyuxdcnoYiF544SSws3ZIY5iZxPAtw6F+195kbvyDPz4JY5kOGvpiFwAt7bR0onCOqAp2F/xHboq0fuAotaUnqrwKEaUt0fDeI6Tb0k+AHinVlrblnmugBBPsRjoBF1nXpgN5fwpOzVhIAj5hzSARwsrKlDXiGuNX0gs44nsQ/cZdxGTEPUr9j4Q0FhTVm2YdMd1lfZ9uFg97CbDxyz4HR9KmL6LjduyPe5Jdiy4QF37vd1yt3l5KJLUwyd99aPW7eyG4oDVOs/7AcB/tnu2wgFfVan2JEa93B9Yf/mifb/i7cWEYz6CiXXojSvJrgJcjf10PJKqBRYcdxUHTbXs+TYSdhVfMfFf77ExIyisS7faVqTKeEPD5P/0HA6Gx5KWLwzK9/QYN5E6h5i92wwAIF6+few2W2z9X0qYuMuihLsVvbrYtxX99oqqHEDmYf5c9FXZ2hKVjFAgr5ErHMw160XYCniXMfh9rzrQwSssZ4Qsy+DMSkYpYCepH0sq15ZWiSUqZe+fOItEv0cFwQwxOms0x1QufLRz/x9MCRA3ykRdAiFKREcJfddkOLWL9N1kAbqQlwG+2rXBbXKgZZo3s01H6gd78LeTYvnWxKBiUak88779RsoG7R+cFUNtzPnJc80Zdqcu88rIKNJHYbBHMDSkxYrcT1y8TBWscwe3JCTOpSPEJ4DkczDd71GM/txqKzg8iUcDSxEYjvEYYE/ggA4Jqs
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39840400004)(451199021)(82310400008)(46966006)(36840700001)(42882007)(2616005)(336012)(6506007)(83380400001)(26005)(186003)(47076005)(36860700001)(316002)(70206006)(70586007)(2906002)(6916009)(5660300002)(44832011)(41300700001)(8676002)(8936002)(6486002)(6512007)(478600001)(40480700001)(36916002)(356005)(7596003)(7636003)(83170400001)(15974865002)(31696002)(36756003)(31686004)(43740500002)(18886075002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 06:54:03.8966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2118e48-97b1-479b-0c2d-08db93ee6cc3
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 06:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185458

I have an unsolved mystery here.

If I build an image with "debug-tweaks" in [EXTRA_]IMAGE_FEATURES, I get a=
=20
normal image, where logging in as root works as expected.

If i replace "debug-tweaks" with other options, for example one of these:
EXTRA_IMAGE_FEATURES =3D "empty-root-password allow-empty-password=20
allow-root-login post-install-logging"
EXTRA_IMAGE_FEATURES =3D "empty-root-password allow-root-login"


That first variant should be equal to "debug-tweaks" according to the=20
descriptions in core-image.bbclass and rootfs-postcommands.bbclass.


However, the end result is that the image ends up without /etc/shadow and=20
though one can log in as root, the system doesn't actually seem to know who=
=20
you are, so "root" does not appear in the prompt, "~" does not match=20
"/homw/root", and UID 0 does not match "root".

It's a total mystery to me how "debug-tweaks" has any effect on that.

I'm currently using langdale branch and initscripts.


Any thoughts?


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl


