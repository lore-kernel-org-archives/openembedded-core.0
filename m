Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563C5C7EE29
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 09:40:23 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web10.45985.1685353214491206570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 02:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=CwGPyuOS;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3975; q=dns/txt; s=iport;
  t=1685353214; x=1686562814;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tNcb/VsXE8QDExg8/BqEeXtKxJnZCO4MogAimkNvlcs=;
  b=CwGPyuOS9+L32G113155zTnEfbb2ROlrmCQjutYt1mDiQtj2KLSB1Lfs
   MNHHzD1tWlmCsLe0+ddXqjBMt9uO64bmHuk+VaRH6QJCgq1HfACy9g3lF
   qPOMQ9FREzUjjp911SrUUqK3rzNkoscuLATQoB1wMqV3jJvkXCUWP30Uv
   g=;
X-IPAS-Result: =?us-ascii?q?A0AmAAAEcnRkmI0NJK1aHQEBAQEJARIBBQUBQCWBFggBC?=
 =?us-ascii?q?wGBXFJzAlkqEhotA4gaA4ROX4dUbQOdZ4ElA1YPAQEBDQEBLgsLBAEBhEBGA?=
 =?us-ascii?q?oVcAiU0CQ4BAgICAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBH?=
 =?us-ascii?q?hkFEA4nhWgNhgQBAQEBAwERKAYBAQkBLQELBAIBCBEDAQEBHxAoCh0IAgQBD?=
 =?us-ascii?q?QUIGoJcAYJcAwEQoDoBgT8CiiR4gTSBAYIIAQEGBAWBCgE/AkOdFwmBQgGNF?=
 =?us-ascii?q?YRIJxtAgU2BWHmBbz6BBYFdAQEDgSQ7hBKCLo5Zg18ziSuBMHKBI4EogQICC?=
 =?us-ascii?q?QIRZ4EOCGeBdEACDVYLC2WBJlU+gU0CAhE+EAVVfRIBEwMHBAKBCBAvBwQzC?=
 =?us-ascii?q?RcJBgkZMScGVgctJAkTFUQHhAQDCoEpNTcDRB1AAws7Oj01Bg4fBQQjAUuBW?=
 =?us-ascii?q?AQvQoEZAgQBJCScfwOCDHMBUjsBK4EYZQYpxE0KJ4Nhi3uNGoggF4VVo3sLm?=
 =?us-ascii?q?AMgjTqVM4R8AgQCBAUCDgEBBoFjOi2BHAsHcBWDIglJGQ+OIAwBDAmDUoF/g?=
 =?us-ascii?q?xWKZXUCCy4CBwsBAQMJiGyCWgEB?=
IronPort-PHdr: A9a23:m2iQUR270RPsCqhksmDPZ1BlVkEcU/3cNwoR7N8gk71RN/7l9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF9uLeT0BpTVg+y81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:iRAJr6KWHZm+yRfMFE+RzJUlxSXFcZb7ZxGr2PjKsXjdYENSgz0Fz
 GoXW2uCPa2LZGSgedh3aty29xlTuMSExodiHgQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbuS6ULas1hxZH1c+E39800M7wobVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQQy1YsfJeo1an4IsDbQnvls+
 o927t+/HFJB0q3kwIzxUjFRFyV4eKZB4rKCcT60sNeYyAvNdH6EL/dGVR5te9ZGvL8sRzgSr
 JT0KxhVBvyHr/m9wLOnUO5grs8iN8LseogYvxmMyBmAVK93HsubGPiiCdlwwx4bicRoRPrlb
 ZA+ZmUxdUXSUh8WJQJCYH45tL742iagG9FCk3qSvacx7m3ZwQB93bSoO93Pd/SORN5JhQCfv
 m/A8mHzDx0WOdDZziCKmk9AncfGmSf9HYkVDrD9prhhgUaYwSoYDxh+uUaHTeeRikmTf8NPA
 k8tpREt9Kkb6X7xdYK+UEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblToqBYcNLTKU+drH1QXO
 k+1c8DBXmY/7eHJIZ6J3vLF827jaHB9wXoqOHdscOcT3zX0TGjfZDrgR8xnGai55jEeMW6tm
 2zRxMTSakl6sCLm/6y/+VaCiDW2q92ZCAU0/Q7QGGmi62uVhbJJhaT2tTA3Dt4Zc+51q2VtW
 lBfyqByC8hVUvmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehc0aJdUJ2SxP
 RWC0e+02HO1FCb6BUOQS9/uY/nGMYC7fTgYfqmON4EXMsQZmPGvrXAxDaJv44wduBF8zf5gU
 XtqWc2tFn0dQb921ya7Qvx17FPY7n5W+I8nfriil07P+ePHPBa9EO5VWHPQNbpRxP3f/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcun8ZQJKbXZflQO9aNII6a5/I7NsrdNxsx9vuzJ5
 Xq6HERfzTLCabfvcm1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:T5ulFK3uMv/vy7aBQNTyAAqjBR1yeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5+xoWJPrfZvdnaQFhrX5To3SLTUO31HYY72KjLGSjwEIfhefygcz79
 YaT0DxYueAd2SS4fyKhTVQVuxQv+Vvk5rYy9s2rU0dMD2CApsIh2wUe2XrcHGeBjM2eabRf6
 DsgPav0gDQAUj/Gf7Lf0XtMdKzw+EjkqiKXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrGG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRUXeZ
 j30lUd1vZImjfsl1KO0FzQMs7boXATAkrZuBqlaL3Y0JXErXwBepJ8bMliA2vkAgIbzaJBOe
 RwriOkX149N2KboMw7jOK4DC1Chw66p2EvnvUUiGEaWYwCaKVJpYha509NFowcdRiKo7zPPd
 MeRf003swmOW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaMqAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu7djDlhCy8rBrZbQQFm+oQoV4rmdSt0kc7jmZ8
 o=
X-Talos-CUID: 9a23:w6zxb2zltL3ib+JWGdPEBgUUHe0BY230z06PGEzhCE90eueuEhyfrfY=
X-Talos-MUID: 9a23:j64C8wtyEL0xjEeh3M2nmxhJO8NOuqiVAhoqnspYopiWBC4pJGLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 May 2023 09:40:13 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 34T9eAms022682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:40:13 GMT
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,201,1681171200"; 
   d="scan'208";a="2101051"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
  by alln-opgw-2.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 09:40:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDK0dBz1FEIL8Q0er2M4lhnYP5QjuR5afgTgj73RAZp4isdW5yKWS+QxkrNR1qKjL2AehQTMKTmTs2lYrldunNDHo8fATxpdqA8aYP3TzU/33b9ILZZnmuB0VEO3Ygr/uOLjfboZbMqrxk6HWhpX+EFfscZl18E8irVnSfk5TgzSCkW8DWtHvFFqP3mhOiuoub3N0yX4eiFlhHRIsmX3u4yfXM182f/9PjFhuB+XACGE+8AzjobX2kKpyA+fnbPsFX7WVbiNL7JVkLMtj0KquEc9iXVHrg4RjlH6W1DVn7xP5STHtAUdsAEpuH5sYRnYeQ+C0Iu34aBawHzkpbLyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FY3vUYJMYM1SjdlOosNuOS8U63PvKtjuzkBAJP2poc=;
 b=hndQeHrihpmbaAQsBcMEYXZKFnf2CJ2wnZXNQewXzsHR1NbCpcsn0rY/kcicPQAecj5J/s8YEftUttC3csskg8zwm20PuK1hzp8PosEetEhQOg/UipJlxO0/dSd1hBCoHctApubfWGl5vC6CJhTzmEqsiTj+uePS37L5oq8N4yQA17pqrCyAuoAEvjyNrVmc0iyaCINH91yCQH3+Zv4UqsHpf76Z3r8Tk67TRGUnuvkvl5+Is0ofKo5zp3aWhHgTcO9fDzlNP0YlcC52srmrIgMdhejc/Bj3ShYHYVIFRZpURGNxAWf0Jdta4Qmhc6P0NP9JWXQ24WJCoMJ0yE3a7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FY3vUYJMYM1SjdlOosNuOS8U63PvKtjuzkBAJP2poc=;
 b=Z7vFXw+/5F40HrTCv4vkW0Vgl8tNlKM4PR5xndI6diEkKVxnvh3CEDTVlDyuxrAyBRsJCiDcNKw1zcC4H0+Ful8YVIoYIOlsIATfaIcm3rjsD2fWKiVD0ST7Wt61jvXi7KJ7+0w1aWe17iXcLJC9/U7hvgNvsaU76wtD/3O/z8Q=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 09:40:09 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 09:40:08 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Xiangyu Chen <xiangyu.chen@windriver.com>
Subject: RE: [OE-core][PATCH v2] sysstat: Fix CVE-2023-33204
Thread-Topic: [OE-core][PATCH v2] sysstat: Fix CVE-2023-33204
Thread-Index: AQHZkgQK2ydNeQ4BfUWI0aLTBQiDCq9w/eIw
Date: Mon, 29 May 2023 09:39:43 +0000
Deferred-Delivery: Mon, 29 May 2023 09:39:25 +0000
Message-ID: 
 <SJ0PR11MB67176120FBF56CED0A59BA6BDC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17638E863967F149.14832@lists.openembedded.org>
In-Reply-To: <17638E863967F149.14832@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|DM4PR11MB5263:EE_
x-ms-office365-filtering-correlation-id: f5f9e063-0be8-4a4f-816c-08db6028b10a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WMcy/BIsPccrzsAFAKg+zcXFfvAHBGm+TsbS2lFs0cFsieZkrJxUIzCaxurSby/1mGvVQpXS9fLp1HazFw1d/EuBaIaxdPeNaiuP0tRK8UJmC/lfEE+7ln89LPnfdMMgp4sgc/jXE/uZtAi6Z6AenS5ObS9oozYgb+Pei+zDPJKXm7Jm8G0+DxIUScdNX1rv/lSOe/0PyrQHTQp/eVN0XY4rjIlk9y69aR3KpR9kXgclMvUtLXg4oRWSdut6i/0rFXoS1rxtFbDXdPHMnNWRW8dWS7m1jjI13SaQ38KTl19loCRfAY0DineVHptwGDYpnUhvtU4dFDOuGFlotW/PMqmvxnyLLrPkR/6vnUyweSyW9oDcsQI/4FG2+lnP+mpt2K8coM9qdPmCcjlP0NYvTatevbo87HOTGkKme/wrtzB531ozY2QAygFflJHGX80GGoPiAMcL2deYTh0OYTZ8spkzxv0oPihDqGpZGCpBmB+EG8WDf6lEPx76OYYDqUC0WYV4cfDAiDRhIWqIROFmsQk43MjYFDE715MyD7uiYCxeVoxSyTWAaO5bfCTVD3/oufRMLLYNg2unOTgp91RTqN4nGeXO8OxWA/uSTFkMUKNYbOVxzwOaafqNSYKXnQLI63TfZDK0FYayW0o1nDtx5g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(7696005)(86362001)(41300700001)(38070700005)(966005)(55016003)(4326008)(6666004)(71200400001)(316002)(33656002)(66476007)(66446008)(66556008)(64756008)(76116006)(66946007)(52536014)(5660300002)(186003)(478600001)(2906002)(9686003)(6506007)(26005)(83380400001)(122000001)(8676002)(8936002)(110136005)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ExTeBoeY39pQ8x48BYPH1/63wVTtBRnPv3ReNLiLc/9rwbOhAGm3P6R9a8O1?=
 =?us-ascii?Q?dyzHEUCyOCs9zVjCEayQwra+unsMyj3muNZDWt0DXZkGLiobGooho2nnlL47?=
 =?us-ascii?Q?2iQ/YwKs2zqZgf+jacWb9A23Q91jIHbxcEyCw/Gv7eArr3qE1SxISi86Q3Wv?=
 =?us-ascii?Q?iyeEqUxaxqFbD5Ne3o4fsl+k6RRJFdJIT6syuWg7Bnk9F4BGgre1IepD3z+y?=
 =?us-ascii?Q?WwiwElWWDmjG7ZJ0m4rkQt+C+FtbZ4c80kfhdgcklSt7BbWaNtXpnEA20tcA?=
 =?us-ascii?Q?uwbxjLh7yYp8rrgM+geZGluX/fkAzC51Nr3ufMz2ginG5Ufy9jlfVpyC0n8e?=
 =?us-ascii?Q?H5/jGpc4Df5Iv/eFhKtzPGt+BotQJYa0hxSOiTG6m739Kayofqk0iXDLCQqo?=
 =?us-ascii?Q?6zkpInag/rAvP+8VmRiwFrHiHlpPi9A/5z9111wkyBTh2cN7NltLoZfXlkWY?=
 =?us-ascii?Q?1Xssgpf24nw0zJLvAhhHuxJGIF1hqkftJe1O3HP6aHsnaBTIjEkkrS1WjvXc?=
 =?us-ascii?Q?ggn1mI6NQIF9ZQY/SUGOYCrapX2f0Idr5YptI7p0Yx6pf63EFVnRRd287CUK?=
 =?us-ascii?Q?hfWWNQPXmFLUo+yCgfdGhEkQKRYxOges9t3nLELm0xfaapbhy3o0T0ow2XIq?=
 =?us-ascii?Q?6qM/INzqVWt9g3qWdLXHjAfwEPyMHkn05hjwetNpBKp5IumtGP0yIdJ1NlCu?=
 =?us-ascii?Q?W841jwuBQ4L04xtIhDqyhuH38BAUIqCxRIr8abbO7+4aU4HDn4fd3i48XeKM?=
 =?us-ascii?Q?jpdcbgqRymASUxUTQPEqwTEGVuC8QcRaqgX/yE6e7prSYuf+xEet5S4/Huv9?=
 =?us-ascii?Q?c0n9iBmDe6rpwDr0kDQTbqwtgpPH/H/CRYU4rn3LuUf+0tH1tCy+vlUz73cD?=
 =?us-ascii?Q?cTLZiDzTWxa3PRz1UYuzh+4ASm8eQvnnVaKi+LTUab/sBqH4QXL2+iQZgzIk?=
 =?us-ascii?Q?JTGp84quaC0zw5QSqUxBsZljcPzfGkk3KP8sZGaZOBRq1gv25+HmA0A8eISL?=
 =?us-ascii?Q?wd8MbUqIuPiVCOwUXkCSY3tuFShQxVH2NB2XuSyRGi1+WPGBdky2HUAdiJnR?=
 =?us-ascii?Q?kuqvG1V5mHPV177OYEgs2MPgQ5DTd+4KZG8+zXwlTwX1pyIxompZ0RbB3oKz?=
 =?us-ascii?Q?yOEn5+rNBgVdf5NGiUduMcua3R66v9T1j89r3BFSpxsChJwCQdfkyEOorJvV?=
 =?us-ascii?Q?qIh7TEYZYz/GJ/oyXIGRGCwzYeQtKbWZIetWo6Szq+nO4PZJJ7lXTrauWE2I?=
 =?us-ascii?Q?Z80kjApxu21TLDDPJkTk0zq/YP/VmWBCXVH74eKvyVfDb/tELJEXgT3Vgs15?=
 =?us-ascii?Q?9MqXjQ19+Q7Gc23lg4d+t1ltmajsIvr8gKt/t2AzNZCVs/YgXOP/K4hfHjCO?=
 =?us-ascii?Q?1R43SYezrt3RgUvwruqbcM11Za/6T8lzd75WIH2mtEJpFpzkq2f+at/GdZ76?=
 =?us-ascii?Q?TSOkmNgkHuaQC9xS9IM2X3VdvcpieS28F2IqJChMc0OBlTC8kUyI9hsBm0fD?=
 =?us-ascii?Q?12jcYBWdl8+clwGH0QbmrGfKbx+CSeCNvk5VFWUgHGayjm8W1anL0xGIhMrv?=
 =?us-ascii?Q?pRZp2vaUs0SLnSZDmle1NlYsPkZO7Lb2SA2C1i0+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f9e063-0be8-4a4f-816c-08db6028b10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 09:40:08.7823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NitSBZv+TCQMHgVnK8MSykPkCRbeTjpQ4W4lfiqozVC8rL9VPhsN8258ONGUw0bFbGy2QZUYpR3S7+8F/EAmfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181857

Hi,

Updated patchset and commit format as per reference CVE guideline.

Thanks,
Sanjay

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod - E=
-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Monday, May 29, 2023 1:33 PM
To: openembedded-core@lists.openembedded.org; Sanjaykumar kantibhai Chitrod=
a -X (schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com>
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>
Subject: [OE-core][PATCH v2] sysstat: Fix CVE-2023-33204

From: Xiangyu Chen <xiangyu.chen@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-33204
https://ubuntu.com/security/CVE-2023-33204

Upstream Patch:
https://github.com/sysstat/sysstat/commit/954ff2e2673c

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 46 +++++++++++++++++++
 .../sysstat/sysstat_12.6.2.bb                 |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)  create mode 100644 meta/=
recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/m=
eta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..a7b51f3217
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,46 @@
+From 0764cb56df4a5afdf04980c9eb6735f789f5aa42 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport=20
+[https://github.com/sysstat/sysstat/commit/954ff2e2673c]
+
+Backport Changes:
+Adopt additional changes as per following merge commit of pull request:
+https://github.com/sysstat/sysstat/commit/6f8dc568e6ab
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
+---
+ common.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/common.c b/common.c
+index a3d31a5..138920c 100644
+--- a/common.c
++++ b/common.c
+@@ -447,15 +447,17 @@ int check_dir(char *dirname)  void=20
+check_overflow(unsigned int val1, unsigned int val2,
+ 		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 * (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 !=3D 0) && (val2 !=3D 0) && (val3 !=3D 0) &&
++		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
++		(unsigned long long)val2) ||
++		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
++		(unsigned long long)val2) < (unsigned long long)val3))) {
+ #ifdef DEBUG
+-		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+-			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
+-			(unsigned long long) val3);
++		fprintf(stderr, "%s: Overflow detected (%u,%u,%u). Aborting...\n",
++			__FUNCTION__, val1, val2, val3);
+ #endif
+ 	exit(4);
+-		}
++	}
+ }
+=20
+ #ifndef SOURCE_SADC
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes=
-extended/sysstat/sysstat_12.6.2.bb
index f9e5778e76..b5014eaefb 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -2,6 +2,8 @@ require sysstat.inc
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da23a74b3f4caf9616230789d94217ac=
b"
=20
-SRC_URI +=3D "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI +=3D "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2023-33204.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196=
229261c563fb48"
--
2.35.6


