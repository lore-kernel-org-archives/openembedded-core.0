Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C584C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:06:35 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.60])
 by mx.groups.io with SMTP id smtpd.web11.6553.1651820792453173239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=pqLbhGEE;
 spf=pass (domain: arm.com, ip: 40.107.3.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IRlj+Fy5cKm0Z1yf5EYvkqXgpocsSwj37A5y2BBelvfffoVf3+ivdUUWnTy+PtX8IiEhF1hNoFg19K3HoTpSsD2rD5GFlUYUzeY0bjKkzFvT7cMHd1O95oKQMVuQQ8DcTlx9hUQkrUAbAkikEqKdtDROA5ce1WXtVZcowkwDVIav8nfitzhjhj5mqp4kLIvz0oXrsRDVCI2n8Qb52piT/AP1Wh9qr+Do+X4DIAf+81OZWFHeYHcF/Rm5XiYM7hIw2Mw7ZlKNtcGjRUqK9uNl3YjhgL0FlV1cNfUESE8hl02gL3XIsO0fa259KzGcIfbOy2um1NHbtjiASKNceh0gxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYGyaGjhVbrFpKFw3O50fQnDoWu98Brue1k4Jjh5eA0=;
 b=CJgAblY22n2375j/3RYoeQKXM2c5mhhz3rCAk8Q6xLOqaF9SIqZ0pB22mCDe4hhBPyv4OUEjZRHlRGkTQw5x9ZoIXx1pZKbPbbd0y3zQWNlTSxLlMgifVVtYHTTVURzKcbr9zc4vxI6+hBVhNTZiGTzEWr/fPB2hZocUyVYxyzCvappDt5ybSeD3ZMyqgQPewhy5i1uXbn2CfVuQFeF/PmV18MWrZ1kMX1eWcU72GVUTlUiCOcuRiYYzrwClCSN2NczCdD81VBOFRx0sZhszU6gIYN2k0RvchwrE+Ev6sj/2gpJoJJGhFa8PSXmgb2WfbkELGrHvmH/gK3eXujOvfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYGyaGjhVbrFpKFw3O50fQnDoWu98Brue1k4Jjh5eA0=;
 b=pqLbhGEEneV++ab+f7HjbMMk3QRT+GqMy8uc6ZfXDePRYJ5WGHetyZ0B2X7ae28xnOCjK1WA/wsDswpkBSXE8VOxnGDvzmmAoNmo0yECcyzfIo7511a6nhzR1zM/l3CszA9T8GCHmH+ta9p/fjli9T4C1+3B5AewpSr2p+QWnFU=
Received: from DBBPR09CA0022.eurprd09.prod.outlook.com (2603:10a6:10:c0::34)
 by PAXPR08MB6927.eurprd08.prod.outlook.com (2603:10a6:102:133::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 07:06:28 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::6d) by DBBPR09CA0022.outlook.office365.com
 (2603:10a6:10:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18 via Frontend
 Transport; Fri, 6 May 2022 07:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 07:06:28 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 06 May 2022 07:06:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 546ad1b82aeda1ff
X-CR-MTA-TID: 64aa7808
Received: from e15915f51292.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C88EDDFD-A5E6-42FB-97ED-07B839F46C16.1;
	Fri, 06 May 2022 07:06:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e15915f51292.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 May 2022 07:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/3NaNTQekVpyQ827VDDTx7SohEUP1+fqnMMN9fx684Ls5MCGKVS1sH4TdcfJ7dC+joU6mve2IgAt2yPyZtiH4dksmT4lRRIJL3WVqL2n/uLFt1izzPfZ8wOgnN9rVTR+l9bxnA4p+LduwX7fYpeqM1pnEKMNd5Q3MuMOyyjt+oKjTJ23S6FxMkWQOnAR496k8yCNuxYz8Ebt/CnCkJKwUYMqOcQJdQ2W/U10B93AQZ8qactqZO8c8a1asUFa+W7AiVkg6hhAD83uaR6UNdN9OQD0B+FWMq+jXBKgycCixvT1PBDlrfgLOlOmNQ8QHqCfmhmzoXc0vNY5rtzv/d8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYGyaGjhVbrFpKFw3O50fQnDoWu98Brue1k4Jjh5eA0=;
 b=gxlsxOUhg9yAXcGDl/kLn1OZsqeN9Mt/7LEpgy4R84wW/dz6opAXBte5O2lhdl/JR1/zDRr+Fy6/F700SmcV4Ck5fW7DEtFKRGLW/hz5TBkcpA+UiiyA99IiQpN3UUsQoqqeZ82ZtVhmRVomq03MdhGrI+RhnDada1m5oTISj7FuRUWrLGWQoXHmwVv7sVzCHqODEoNJCAi4oDs+/47AeXhvsfbct0wICdLqOWE8zsJKY3oTkYEDqfoicQJ1vmon8nV63fW6MdZlkCIxKpMgXCiox43hONZATDTX87h9V7tUUy3AnlNHE4Z+uv/bFiP8MuQWT3zahihCceZvS4Ofww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYGyaGjhVbrFpKFw3O50fQnDoWu98Brue1k4Jjh5eA0=;
 b=pqLbhGEEneV++ab+f7HjbMMk3QRT+GqMy8uc6ZfXDePRYJ5WGHetyZ0B2X7ae28xnOCjK1WA/wsDswpkBSXE8VOxnGDvzmmAoNmo0yECcyzfIo7511a6nhzR1zM/l3CszA9T8GCHmH+ta9p/fjli9T4C1+3B5AewpSr2p+QWnFU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB4161.eurprd08.prod.outlook.com (2603:10a6:208:134::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 07:06:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%7]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 07:06:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Chen, Qi" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: GIT_CONFIG_PARAMETERS does not work
Thread-Topic: GIT_CONFIG_PARAMETERS does not work
Thread-Index: Adhg+V6j3tCbo93+RhmDQO5OGe3wcAAHlgQ8
Date: Fri, 6 May 2022 07:06:19 +0000
Message-ID: 
 <PA4PR08MB74110EB6227452C5830C9D1FE8C59@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <CO6PR11MB5602F4C0C926F81D7092C5CBEDC59@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB5602F4C0C926F81D7092C5CBEDC59@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ed04d2c1-f806-442b-5e75-08da2f2ef0f1
x-ms-traffictypediagnostic: 
	AM0PR08MB4161:EE_|DBAEUR03FT013:EE_|PAXPR08MB6927:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6927BE5658E1F181915B4825E8C59@PAXPR08MB6927.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZAZ/AGGfXTerAH3l1RB8Uwx0XzSrrlu31H731ClBpuWDHU9RGIhQW0hJeTK2SLxFmabzB/qSPEdqszJQUVUCa5R5LjpgLzRUBmNd8CobJ56vy3AtmiazBwdWhpTBEzEW8z+6c4DrYiNqMAMkJdzKx0B1gFKbnCDdL7269TJ8FZ6iFcetKWcdFpM/mfLjJ9YBpKM+7IXygglt4pUnfvxJ9mmGOFFjR7T6ZgLdoSCg3LyluLSBM3TPaXHLSsDmMcgSa8zMJ963qTMenEd/0O5MO7JekURbz+W7a/lUk4VgwsFoBGyLXRTcXmlq0n6GkSSYmefKcoSaSwVFGAwycL9pIc8PR5M4aKNE00QMr4FyUwVBSOLG/5Vgm3zFAnUzhLS8gnrD2H7VE88vGrQ2Kzfx2gCo8YvYKc+/hvrxn4xx+txtDZc7J7ZLiazirEgERn2ZHu2O24zJ+g14zqbB8GSgAQG12bX2t/qsVA32lvnjBD607FJ/+y0F0WnT5JrIN9XTF2K0/rLZyIpqo3ww0xjWwlUti69l7ID8NOhSrdJ9iSRUXzjx8o+KNozq1nAd44bRLEWOtQ+DlGqMH6i9nGrgyZYXO2Ldn0A7hesfHhjaK5Nz4adNDdrEH7gjpVcoIozaHnAg9qYNm29I7Kr6mOns+nVhk6P96m2+yCe/ObSI7syPXvIEEDABAjzgO2y6jI1hkGD2EoFkp2xFzL3eEaUjNVfYlYukH+9Zn8jl7YfzLvK9NwHI4y2HbVANZfk+fp4NAHpQpSH58q9F2DqL8G1dBmOMU9kt3tQfGqwXMoLvF58=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(6506007)(83380400001)(110136005)(508600001)(19627235002)(64756008)(966005)(53546011)(316002)(33656002)(71200400001)(54906003)(9686003)(186003)(55016003)(38070700005)(38100700002)(2906002)(4326008)(52536014)(8936002)(66476007)(66946007)(66556008)(66446008)(8676002)(122000001)(166002)(5660300002)(86362001)(91956017)(76116006);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB74110EB6227452C5830C9D1FE8C59PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4161
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	795bbe0c-0547-4119-264b-08da2f2eebed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mCJXqhIyopmIc6wLFuTWkVayYDMyUmn1ajrLqbvLWJ/poA5Wv8NIp7N1SMpzdOel1WbCnyp44p9JZqXgh1X7/mcYV0MfRLIjANDK5Z1BENX44awMOk5StEHOkH/hDouOtviDq8eLnxV52mv2D+8PCz1WaOoxlmHnwtufRtYmgXAcbIxgqrbvGAjxHm0gXNxPlyxUmxgkhlAoOuJlfMRMTjfx5Dt4SEBPG6+Vxw2PJRqUySMKoZP3ogep5UwgA4n3WzLbwXxbUPnqi2UqL0X8iDLlApAgkb+9pokswzo5WAOeCnT59BZkjS4tA7YCmcBdD9bfcgn7tCFRGQanOt/Da08uHlgei/Pkp2W5xK4mvr5wqKyWjA4kUIBIOZoch2SnZoTzFQXULVwk9ayelPJ/ytRDuRlVj0W9UxVJ5h+J4JqdQuvJHJhciMn2xEWccKnud/d2N1NikAYC7vsx+AISrT4eIScgTtra6uNeHXnuLsQjZ3WfkYzj4GqUhc6dsEV9SlZ4er0d9WFjFd+C8OLRkwzQu98tMX4UfrCgKxVNEDcrcI54l5hVUaSlm5zwxXwEONkeC5rPCfLmGchDDbtThdv4vDJR2fkADoxTrZGNqcMX72qUV4OzBIYvhBA/SX5hq9LTZebDOWzjW9MIxFsYsjGmfNhsblyH6Efb67wtCHxxbWcSsCzOQeilyOUABUoMJpX2Bhx/7QGIjpFBbnMDLp9Jf/WPNjFaV5/QFKgf5XTcI+aaOY6Y9DiV7XhECyt7CjLrQ3HMr/u5aFr7PXTwGQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(8936002)(36860700001)(70586007)(52536014)(70206006)(6506007)(166002)(81166007)(8676002)(5660300002)(356005)(4326008)(26005)(107886003)(86362001)(33656002)(9686003)(7696005)(2906002)(53546011)(40460700003)(47076005)(508600001)(186003)(336012)(316002)(83380400001)(966005)(110136005)(19627235002)(54906003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 07:06:28.3541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed04d2c1-f806-442b-5e75-08da2f2ef0f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165328

--_000_PA4PR08MB74110EB6227452C5830C9D1FE8C59PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yes, I was actually going to send the patch for this today. :)

Ross
________________________________
From: Chen, Qi <Qi.Chen@windriver.com>
Sent: Friday, May 6, 2022 4:44:32 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ross Burton <Ross.Burton@arm.com>; richard.purdie@linuxfoundation.org <=
richard.purdie@linuxfoundation.org>; raj.khem@gmail.com <raj.khem@gmail.com=
>
Subject: GIT_CONFIG_PARAMETERS does not work


Hi Ross & Richard,



I=92m building hardknott on host with git 2.36.0. And gnulib do_install fai=
ls with git unsafe repo error.

The same error could be reproduced by reverting Khem=92s fix for gnulib do_=
install and building gnulib against master.



| fatal: unsafe repository ('/ala-lpggp72/qichen/Yocto/builds/build-master/=
tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/git' is owned by someo=
ne else)

| To add an exception for this directory, call:

|

|       git config --global --add safe.directory /ala-lpggp72/qichen/Yocto/=
builds/build-master/tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/gi=
t





I can see that we have already been trying to use the GIT_CONFIG_PARAMETERS=
 to solve this issue. Related changes are:

=93=94=94

+# Treat all directories are safe, as during fakeroot tasks git will run as

+# root so recent git releases (eg 2.30.3) will refuse to work on repositor=
ies. See

+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7=
d9 for

+# further details.

+export GIT_CONFIG_PARAMETERS=3D"'safe.directory=3D*'"

=93=94=94



However, following the link above and I can see that the commit message say=
s:

=93=94=94

    The `safe.directory` config setting is only respected in the system and

    global configs, not from repository configs or via the command-line, an=
d

can have multiple values to allow for multiple shared repositories.

=93=94=94



If I understand it correctly, this means that the command line environment =
variables have no effect.

Also, I figure if some user could set his/her own environment variable to b=
ypass this security check, then this security check does not make much sens=
e.



So I think we should use the intercept script approach and add back the fol=
lowing line.

PATH:prepend:task-install =3D "${COREBASE}/scripts/git-intercept:"



What do you think?



Regards,

Qi

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PA4PR08MB74110EB6227452C5830C9D1FE8C59PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div>
<div>
<div>Yes, I was actually going to send the patch for this today. :)</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Ross</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Chen, Qi &lt;Qi.Chen@=
windriver.com&gt;<br>
<b>Sent:</b> Friday, May 6, 2022 4:44:32 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ross Burton &lt;Ross.Burton@arm.com&gt;; richard.purdie@linuxfou=
ndation.org &lt;richard.purdie@linuxfoundation.org&gt;; raj.khem@gmail.com =
&lt;raj.khem@gmail.com&gt;<br>
<b>Subject:</b> GIT_CONFIG_PARAMETERS does not work</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:DengXian}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
span.x_EmailStyle17
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-family:"Calibri",sans-serif}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Hi Ross &amp; Richard,</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">I=92m building hardknott on host with git 2.36.0. =
And gnulib do_install fails with git unsafe repo error.</p>
<p class=3D"x_MsoNormal">The same error could be reproduced by reverting Kh=
em=92s fix for gnulib do_install and building gnulib against master.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">| fatal: unsafe repository ('/ala-lpggp72/qichen/Y=
octo/builds/build-master/tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-=
r0/git' is owned by someone else)</p>
<p class=3D"x_MsoNormal">| To add an exception for this directory, call:</p=
>
<p class=3D"x_MsoNormal">|</p>
<p class=3D"x_MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config -=
-global --add safe.directory /ala-lpggp72/qichen/Yocto/builds/build-master/=
tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/git</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">I can see that we have already been trying to use =
the GIT_CONFIG_PARAMETERS to solve this issue. Related changes are:</p>
<p class=3D"x_MsoNormal">=93=94=94</p>
<p class=3D"x_MsoNormal">+# Treat all directories are safe, as during faker=
oot tasks git will run as</p>
<p class=3D"x_MsoNormal">+# root so recent git releases (eg 2.30.3) will re=
fuse to work on repositories. See</p>
<p class=3D"x_MsoNormal">+# <a href=3D"https://github.com/git/git/commit/89=
59555cee7ec045958f9b6dd62e541affb7e7d9">
https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9<=
/a> for</p>
<p class=3D"x_MsoNormal">+# further details.</p>
<p class=3D"x_MsoNormal">+export GIT_CONFIG_PARAMETERS=3D&quot;'safe.direct=
ory=3D*'&quot;</p>
<p class=3D"x_MsoNormal">=93=94=94</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">However, following the link above and I can see th=
at the commit message says:</p>
<p class=3D"x_MsoNormal">=93=94=94</p>
<p class=3D"x_MsoNormal">&nbsp;&nbsp;&nbsp; The `safe.directory` config set=
ting is only respected in the system and</p>
<p class=3D"x_MsoNormal">&nbsp;&nbsp;&nbsp; global configs, not from reposi=
tory configs or via the command-line, and</p>
<p class=3D"x_MsoNormal" style=3D"text-indent:10.0pt">can have multiple val=
ues to allow for multiple shared repositories.</p>
<p class=3D"x_MsoNormal">=93=94=94</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">If I understand it correctly, this means that the =
command line environment variables have no effect.</p>
<p class=3D"x_MsoNormal">Also, I figure if some user could set his/her own =
environment variable to bypass this security check, then this security chec=
k does not make much sense.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">So I think we should use the intercept script appr=
oach and add back the following line.</p>
<p class=3D"x_MsoNormal">PATH:prepend:task-install =3D &quot;${COREBASE}/sc=
ripts/git-intercept:&quot;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">What do you think?</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Qi</p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PA4PR08MB74110EB6227452C5830C9D1FE8C59PA4PR08MB7411eurp_--

