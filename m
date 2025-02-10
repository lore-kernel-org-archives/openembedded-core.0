Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AAEC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 12:00:59 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web10.49153.1739188855459506839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 04:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=D72cGMu0;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5153; q=dns/txt; s=iport;
  t=1739188855; x=1740398455;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=POubRiFUAynGWdNnBxIkhJ4puvKLzW9/sm48hMYjggE=;
  b=D72cGMu0/Z9fLixFe66Pbnv/4AKz3Pzqs39rIYq15ahKjN0DBz9lgllG
   8JdLo8oyq7xGNJwdLkZwqCQeAh4mTYqWmE53bGVxqy8c617cpm6ZpYPXQ
   lBo8K6MY/ANBRkFScoQ30xAvzBq4D8KcoK7uwxN6Cy6JzJc+M3KcXjmVM
   4=;
X-CSE-ConnectionGUID: Qr06qtNVR6+595rkstqpXA==
X-CSE-MsgGUID: 5MnWjRl4QXSyD4DgpehfIw==
X-IPAS-Result: =?us-ascii?q?A0AFAACg6aln/4oQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQCWBGgUBAQEBCwGBQDFSB3QCgRxIiCEDhE5fiHeXP4ZVgSUDV?=
 =?us-ascii?q?g8BAQENAi4BBg8EAQGCE4J0AosDAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4V7DYZaAQEBAQMBEWcQAgEIEQQBAQEuJwodCAIED?=
 =?us-ascii?q?gUIGoJhghwNOwMBo3ABgUACiit4gTSBAeAigUgBiE4BKoEyiQYnG4INgVeCa?=
 =?us-ascii?q?D6CYQQBgV88g1eCLwSCL4FuAYJYZ5pUiS9SdSIDJjMsAVUTFwsHBYEpSAOBE?=
 =?us-ascii?q?SOBIwU0QTkBgg1pSToCDQI1gh58giuCIII7hEOES4VYghKBYAMDFhODIXgch?=
 =?us-ascii?q?E0dQAMLbT03FBsFBIE1BZ0FBwMQWwE8hnGkBYF7oXAKKINzjBiNOIgsF4Vap?=
 =?us-ascii?q?HiYfKkEAgQCBAUCDwEBBoFnPCuBLnAVgyIJSRkPji0WiGu/THgCOgIHCwEBA?=
 =?us-ascii?q?wmSKgEB?=
IronPort-PHdr: A9a23:02iRPBDgWwuL8hF1TEB+UyQVXRdPi9zP1kY9454jjfdJaqu8us+kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:DzOVeq0wtXJSiH0hg/bD5Ytwkn2cJEfYwER7XKvMYLTBsI5bp2dTn
 WtOXmmGPaqCYDSged1xbIq2/R4P6sXTx4Q2Gwdu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmE4E/watANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU4
 rsen+WFYAX4g2QtajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNVtuY5QE3NhNXyITp
 KECKysRdwizrrfjqF67YrEEasULJc3vOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Sojx5nYj/7DLo5m+2pmn7jaBVTqUmeouw85G27IAlZi+GzaIqIK4fQLSlTthu9o
 F3ExWClOyEhJfDD5TWd/3Kip/CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXN9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:mYKFkaAoq+JadbXlHejssseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXcH2/hhAV7CZniohILGFvAZ0WKP+UyFJ8S6zJ8j6U
 4CSdkxNDSTNykGsS+S2mDReLhQoqjjzEnrv5aj854Hd3ASV0gU1XYDNu/tKDwPeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiRw2C1wbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819pqHqW3+4goAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6knWYnq+rXLWqkrdOXcVmj3fIG2j8D/eSP/CNXUH4g169MRkmy7img8dVRdHof
 t2NiyixsJq5Fj77VTADpDzJmJXfwyP0DsfeSp5tQ0EbWPYA4Uh9rD28C5uYeU9NTO/54Y9HO
 Z0CsbAoP5QbFOBdnjc+nJi2dq2Qx0Ib127q2U5y4SoOgJt7TtE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyUwX2MF7xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3cUPzDs+F2oFN73n2MSiAdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt2zYY
 f7BHuXOY6UEYLDI/c/4+SlYegmFZA3arxghuoG
X-Talos-CUID: 9a23:MSboGG1WBTDnUBEi2uRBn7xfI9p9LGTB6knqfQzlWDtzS6aJUEeg0fYx
X-Talos-MUID: 9a23:ORttDgTS2zy2s9PLRXSxoTddNv1sv52eM1EhzbkJo8SEOw1vbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Feb 2025 12:00:54 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 7BEDC180001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 12:00:54 +0000 (GMT)
X-CSE-ConnectionGUID: KiRwKWn+TZauj4hlMS4Edw==
X-CSE-MsgGUID: 4DfEFHypQ3SndjhcRGCvpg==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,274,1732579200"; 
   d="scan'208,217";a="21638492"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Feb 2025 12:00:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4k6B480lO/KJgnBY4qQlZU8MD460kcxP0Z0iq7AFU7+qnPJ1rSsX54SIgkAPAHT7xrl38Yd7Q6wOAPARO0srhsqfjZsM8tvDJcY8jH0dpZdOiRlUzLnmAMz2avM6FU/OqXrxOi5vd6+Ok88YFRKGPdjR8OSHqg0dEmwAITWRyRTl5wWK4rPY2O3v9s4keiI8uh1VGiFuRxSgGmPHD0Y9Nt8U7Dw08RJ0RaTUTGi8lV+posxDiEPduvZWAlo/mP1i8X2zxIJDq6fG6RlR8H+MgGTmKQZ8LpU0Zkho6qIbrtORgiuym4eJGPHZnQcHWLw7l/j2ZSgZhdARlV9jDk0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POubRiFUAynGWdNnBxIkhJ4puvKLzW9/sm48hMYjggE=;
 b=Fgtgs5FwMcPMFGIdE8UVnKiqOGXUQYF6TKklv8IVsk/3k42iUVuzhqZicRzAfNRIrVyFIPHNrAOSkG1KgEtIqsJnQnpzdHkJN906sghWIodO4ca4QPNo5NsLKaks2Mk8Zo95j2ETeeDzYHajL7tZK6C+HCVXvSDqSjPdjasY7P2YjZrg5sbZ4smBgHZ705/DMGyv4ElZctxC8XGU59Rp8uoZnddQ/uHITyDiX4/xRJUvLuoHS8MU2IKqoLK0H2Jnf1qVV8pRS2KO40DdV5a/2id+xwRL0iaKoC78Wg9uUxVnWw43fOjuAIWhKAhIXz9FdEopXEeG81LQY5jxDuje1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 12:00:52 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 12:00:52 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw68=
Date: Mon, 10 Feb 2025 12:00:52 +0000
Message-ID: 
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
In-Reply-To: <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|IA0PR11MB7953:EE_
x-ms-office365-filtering-correlation-id: 18f70f42-ab34-4491-55b1-08dd49ca914c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?mRJN3po5lRGERtR+2XyDqR7/dmgdMfXVrd6koWvPiL7s+rs/Jc7K/wYrUi?=
 =?iso-8859-1?Q?o68nNxwGBlR+3aGz1wfqlUpVaN8b+S6z/qUsk/0aRSGNe3x+0ajLAhhbyO?=
 =?iso-8859-1?Q?s/i5GK6nQdmgd7A77VAioOPVL8Mk3vgGSLj2QaaUQcZxFY5cV9PYJm4iQZ?=
 =?iso-8859-1?Q?4SxEmsj3hXhxeccxKey36N3bgkReIEZpGBsex2Jzo7op25x4Gvjfyba1iU?=
 =?iso-8859-1?Q?Rb73u1dDENz+DSBpW2kcA3Jtr9VyguuAAzKkWdGkop2tMW4KTLxqz+as0Q?=
 =?iso-8859-1?Q?wqqmtsJOx64SEnzCsU8fybtheR9hWs7btaUcXuCS/l12YNvbnwRF676dHT?=
 =?iso-8859-1?Q?73IfckrpZ7l7/MLhIb3rFfWwTDJIui/4X6896aRSj8EtePwLdO0KEadxao?=
 =?iso-8859-1?Q?OvciQhyE5Co8LOu2ZiXzvu0ZLf5uqez6A+MYxPT04uWiDcR+HosekklbMU?=
 =?iso-8859-1?Q?BnLaAYBkdfpaMAxnvhyjl/gYUG9MMZEv8yFnxS0tcI22sZOJRJI3Tdbxae?=
 =?iso-8859-1?Q?gfO+8DGD7PFwUgH2o6hRH8qasvDP54F/uW0t3qmyEdbPuUvlRLKze2rFAv?=
 =?iso-8859-1?Q?bQiT2CEHQpRExRb8eDSGIDdwTdzdwhXMVhIyR7+X78sSM9Cx65zqU9RwkF?=
 =?iso-8859-1?Q?W38ac5QYoBfsHzcv0cb05f2mHzJY/4oawnCxk2sbjJwZXbBebblERpoIMH?=
 =?iso-8859-1?Q?qDb6NNNsexA+WX3EbMxb+Be5+Keq0cE1ag5wOQaM2SdyUbZAksQdpIzOLU?=
 =?iso-8859-1?Q?sA8R+4Zj1dbR4TlbFCtk0SRV32F63l8iY5dbmYIZHd0QZclK9pmQWi0+lF?=
 =?iso-8859-1?Q?E1BVOzJ9qoug4YBSofvnpnapeMFyjwXPkbnib0qWFbChT0cPKn4yTT6l7n?=
 =?iso-8859-1?Q?Zn9TgcbopwHZ6DrnlOZyvgZYDQHFFG7DIB+ckco2CkaWC5UZjTOQwT/81A?=
 =?iso-8859-1?Q?puU6xlQmMttzjYM0p7UkuVmVP7WaMOi47a+MLmALJ/tr/IB+QGnnsUZ62Q?=
 =?iso-8859-1?Q?FLZDA5FJ3L46LFpdggEGjlLTYZ9cVDGSMAcrZaa2BZEdbuqAiJ/5Qe/73K?=
 =?iso-8859-1?Q?6BpLlIECQQRYzNJeFeQN1cqlsBTHe2uoDx448FlvQI9BMd6/Wst+HU9VjC?=
 =?iso-8859-1?Q?igLWKw+18RxwQdmd0/EFVMACq+bzEDHuBqvnhTTyp1dO7Zl6HvJzyoSBzX?=
 =?iso-8859-1?Q?RkQgbWBKz9dSTiNDXTK8Eqv6DrWv+9Kfv56Z9X/LaDPGTLxVYsAt7DuW8g?=
 =?iso-8859-1?Q?TWosH4ocRZyvH2ga7rwQK90j6GD5Vc+TxH1FmJ2/7R2nmzEfsKv8zpDUnc?=
 =?iso-8859-1?Q?PITYPtBY8m5v8d6jJAPtEKF9foIZG6UlX7WE2Ty6UKeSM92GVGVBivUVvL?=
 =?iso-8859-1?Q?A98x2sK7+aerojCjgAp02dAgsVwDPOwAM9R/ggOQUGvDHll5liORGoILtC?=
 =?iso-8859-1?Q?CEtXYmWqSng5X7L7G0RkiW22E+pdLYTy9QJtkNbNV9MTAIHbR/G9MxKmjV?=
 =?iso-8859-1?Q?V20kYVUbZXWP55fGfd4FO4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Ma4E+Y4ccj3V5gH1jVlyXYAIrllGEbjo2e4dNFtXc9k3eSW/g6c7CglAdC?=
 =?iso-8859-1?Q?v6GO1LRWurGTs5wkpwTJqcxxhBsddemQFnfytBGdJ0bRLUlb12eOHpu/RD?=
 =?iso-8859-1?Q?anUfv/XJ5sH/lJmxfFLwQub1+FOjwZFIcLGnX3BgDYN7yElm/UGfvb2JPx?=
 =?iso-8859-1?Q?hE8WAVn6cvZVeLY1ghxL91wvMD2AjCt54aTZL6mCpCM3sMh/IC0RKKBdR6?=
 =?iso-8859-1?Q?/rJFTdenl8NbTAIQhOl+eZp+3VTZQzxJz0QZ/5kICvnABqec/GTH3Sxh98?=
 =?iso-8859-1?Q?ehB9lMS6V2hLr5Gxi268IcpZ1Id37jfbO/ulg99kisIJWRp3StRO5ssv3W?=
 =?iso-8859-1?Q?nBEZPN/15DuvZaMZcQEz7XR/3J6LLHhkMLfvs1nz71VUOYw1O6pjkjg5qK?=
 =?iso-8859-1?Q?GG7W4LQ9IsiQcd9bntod45QSr9HLqeVc1pLVCjRCS1vcRoHgF6mCJg7DT2?=
 =?iso-8859-1?Q?7KeMDdgD3LDJe7q4hOLxdhA0MoXbb8RynGlVgJinj94DVideDVITb8yeIs?=
 =?iso-8859-1?Q?qJKy3Oc6dKgFp/Jgb0lkjtZ2kouhfOj4jfvv70AtYz9oHvY7M8ol9sedkv?=
 =?iso-8859-1?Q?Yy4CjY8ubdNXsPiUvgtLHCpsYeCPgfpKi8H7bDSjgbfeffCO/D7Bn9c6av?=
 =?iso-8859-1?Q?DPB4vGLecKL/MyHg91xHlXOLhYAX0M3RuZ5hIdDjw9eebiO3Bov/0Seh3L?=
 =?iso-8859-1?Q?Z2/jIcj5oCY0Mi5D57Q7YLM5d+XUlRL7O19MAXvskE1clUNX3G5K0n4VWu?=
 =?iso-8859-1?Q?sHMw+BtyoGKASjhHA+Jzk7Lfb9UNefG4mKt1jM/PCvl7jQirq6rxBM4TPb?=
 =?iso-8859-1?Q?H7WqneQli8dDPS98vij2a3EmznOL9SXgSURPibKkJJ2WqfxvyO19qabR4k?=
 =?iso-8859-1?Q?TYEn/YXeUvIz3hC8PSRh1ARNupzg+CeDTENrVKlJE+e10/IJH1XOOdlND9?=
 =?iso-8859-1?Q?34STAbV1QQDzM0uZJdUey4OfvKqyQysHRMisCfPkXNJhDjNkKkPlRwZNuh?=
 =?iso-8859-1?Q?/gOSK4gXvAsKy/V9TTxbDBwLtnAWTZiWNtU5OQhBBQCk6mYj6dEA4epBox?=
 =?iso-8859-1?Q?2SJYgeXeyBpLByR9Va6B1MBAfRyzt1HnSaFrV1exe9uaLHzo76OleUqvpa?=
 =?iso-8859-1?Q?qSWeE8Lzz0h4kO4lwFbA3pEGtOcj7tdCKd+vE8ExgdndqX1m+2iq4ecl7k?=
 =?iso-8859-1?Q?91cuGorqn9423go/VFRdg4b9rlDsEdqZE5erWeYF6bCfOfISYz3F+ezVIZ?=
 =?iso-8859-1?Q?raAxF1YSKV2BwqOmz659Yxtb3V/yomzWztACgKTDlFE5k8yjTELbEQQQ8u?=
 =?iso-8859-1?Q?93OPAdIW5qWc5pV9PrCAMZ3ONIMSu3d6mN4XjGbrv2Wo/rhy+6nfnzNAxO?=
 =?iso-8859-1?Q?z4J8D2arRXU2mwFtFBTlYmF7+LXnUXsIA7rxoL4XE41MBoWXv9g9FJqkEa?=
 =?iso-8859-1?Q?RAxZac0lQGDXVQevU0dlaguOc77Vqgbd+UVEOrzjmF5VFVuJ0hKcSQ/cJG?=
 =?iso-8859-1?Q?GmiszLNsjXPeH6TXOqtjlmwVx7P3RdMq5B3aDUJnJ47I9kjKI5YRF303mf?=
 =?iso-8859-1?Q?oGV6IX1kMecgxD0yKqApqV84DFLQDOHraocZ1zpAYfXyM6Nf+Bq8wuICgD?=
 =?iso-8859-1?Q?ZUCwqS/AV6D618KTvNfT7tMC8ikcoL3mLb?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22PH0PR11MB4902namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f70f42-ab34-4491-55b1-08dd49ca914c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 12:00:52.5957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CjFJure6IYt2ejKz1KUqOVYXIiDD9rS/r4JOKJPz8iknd4l/pdQyE+7unBtTkHYHhwjTci3LZsi6ikXfqIz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 12:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211093

--_000_PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22PH0PR11MB4902namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We have next situation:
- a lot of software components that depend on packages and deploy all packa=
ges they depend on locally inside component.
- some components directly depend on systemctl only (e.g. this binary used =
in scripts), so for every component we have to deploy whole systemd locally=
.
- finally, all/some of those components will be merged in some way and will=
 use systemd/libsystemd, but until then it will be nice to get rid of such =
duplication.

Regards,
Oleksiy
________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, February 10, 2025 12:47
To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@c=
isco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

On 6 Feb 2025, at 14:49, Oleksiy Obitotskyy via lists.openembedded.org <oob=
itots=3Dcisco.com@lists.openembedded.org> wrote:
> Move systemctl into separate subpackage to minimize
> dependencies from core systemd package.

In what situation would you have systemd or systemctl without the other?

Cheers,
Ross

--_000_PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22PH0PR11MB4902namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Hi,=
</span>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
We have next situation:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- a lot of software components that depend on packages and deploy all packa=
ges they depend on locally inside component.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- some components directly depend on systemctl only (e.g. this binary used =
in scripts), so for every component we have to deploy whole systemd locally=
.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- finally, all/some of those components will be merged in some way and will=
 use systemd/libsystemd, but until then it will be nice to get rid of such =
duplication.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend" style=3D"color: inherit;"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Oleksiy</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, February 10, 2025 12:47<br>
<b>To:</b>&nbsp;Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)=
 &lt;oobitots@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 6 Feb 2025, at 14:49, Oleksiy Obitotskyy=
 via lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedded.org=
&gt; wrote:<br>
&gt; Move systemctl into separate subpackage to minimize<br>
&gt; dependencies from core systemd package.<br>
<br>
In what situation would you have systemd or systemctl without the other?<br=
>
<br>
Cheers,<br>
Ross</div>
</body>
</html>

--_000_PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22PH0PR11MB4902namp_--

