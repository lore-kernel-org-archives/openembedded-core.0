Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E0FFD2D6A
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:24:47 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38573.1773145206310889837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MG4Boa94;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: mattware@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2345; q=dns/txt;
  s=iport01; t=1773145206; x=1774354806;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+DKUBrYuLsN90AKsM/9s51ztmi3E6CisHL+xFrmARSM=;
  b=MG4Boa9483fKatyzFBcAFkSLxLQIBKrjMOjq9GbwEESf8NbFHYJHDyJn
   Z2ZWX7QY1eMpzjiriqZyncot7NvTmHP9lSoCo9Bz+iRgQ5UkDeb5nt5/Y
   FQx4tGPzk5XIExOPiWyk58+kBpt6WmPspArNJhu47brlrk4QP0v4vpKl+
   EiGH2PQWrjL46eL2iFxlJNI1WnzMh1dlWubMAt8RRjPRE/orqkMSM8/2V
   UqWIWJukeGr/l/Nr61Ew0e7IfdhVUyFxRXwo+SLHUTE57xVdFmcTGDjxl
   p0U9Bm+emFdaVvqYN3RwVcPD1zjO8M8vDVVByHuLYpu5OYXqwqTKRsF0R
   Q==;
X-CSE-ConnectionGUID: kyz7TRmOSbOrLL95XA0W4Q==
X-CSE-MsgGUID: 3KphIrpXTNO+H+uZrS8JWA==
X-IPAS-Result: =?us-ascii?q?A0DaDgBLC7Bp/5T/Ja1aHQEBPAEFBQECAQkBFSWBKwKBO?=
 =?us-ascii?q?zFTB36BERKIbAOFLKA/hleBfw8BAQENAhQ9BAEBhQcCjSACJjYHDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlAMhl0WZxIBDHMnBA4NG?=
 =?us-ascii?q?oR+FkADAQKgbgGBPQKKKniBNIEB4C6BTQGIUwEqgTUBhBQbhF8nG4FJRIFXh?=
 =?us-ascii?q?2uEE4IvBIIigQ6TIIFEIgMmMywBVRMXCwcFgWYDKi8tbjIdgSM+FzNYGwcFh?=
 =?us-ascii?q?R8PiWZugRODHgMLbT03FBsDBIE1BY0OhAumNYF8oXoKhByiDheqa4ZAkkYiq?=
 =?us-ascii?q?HQCBAIEBQIQAQEGgW8BNIFZcBWDI1EZD9skgTQCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:ri0kBxH8k47munVu1ptF751GfhMY04WdBeZdwpMjj7QLdbys4NG5e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:iax/oazkg18stJS5Ll16t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkVWz
 WBJXz+DM/ffZ2fxKNFxYI3n/RwAuJPSnYJkSQc4qVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvazpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEInL9IkwONQOmtp7
 9g8eW09R0i829vjldpXSsE07igiBNPgMIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cM3WjOX9PYH46tOKhmmXgeidVgFmUvqEwpWPUyWSd1ZCzYIGFIIzbFJ49ckCw/
 UHe/0XjGiEmEvvc6XmYwGiX1s3wtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9cAfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:yP/M4KlC46NNkVSzmpSj0MfUo7bpDfNFiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj9fZq9z/JICYl4B8bFYOCUghrWEGgC1/qu/9SOIVyFygcw79
 YFT0EcMqy9MbEZt7eG3ODQKb9Jq7f3ktHMuQ609QYVcegeUdAa0+4PMHfiLqQZfnggObMJUL
 Cnyo5soT2mdX4LbsK9KEUkcoH4zeHjpdbNWzJDIwQoxjWvoFqThYLSIly1zx0eWzRAzfMY93
 TZkwv236Ons/uq4B7R3W3e4v1t6ZTcI914a/Cku4wwEHHBmwyobINuV/mppzYuutyi714sjZ
 3lvwogF94b0QKRQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINidAfD4UZIhqA97E
 sL5RPbi3NkN2KEoM3P3amNa/isrDvynZMWq59Qs5WYa/pZVFYel/1HwKofKuZ/IMuz0vFXLA
 ApNrCT2B6TGmnqNEwweQJUsYSRtnhfJGb3fmES/sOSyDRYh3Z/0g8Rw9EehG4J8NYnR4BD/P
 msCNUhqFhidL5hUUtGPpZJfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypLE4/vujdpAExIY73M
 2paiITiUciP0b1TcGe1pxC9R7ABG27QDT208lbo5x0oKf1SrbnOTCKDFouj8yjqfMCBdCzYY
 f5BLtGR/v4aWf+E4dA2APzH5FUNHkFScUQ/s02Xlqfy/i7XbECdtarBMo7CICdZArMAFmPcU
 frdAKDVvl90g==
X-Talos-CUID: 9a23:0l4yDW+EiqL4MgHag62Vv00FCJ8ZSHj69333OWucWDtZYeWqFWbFrQ==
X-Talos-MUID: 9a23:arJ0dQg6TR+uQkCtZMVfCcMpb+Rw44W0EHAxt7JFm4qZBzZLaxWipWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 12:16:55 +0000
Received: from alln-opgw-3.cisco.com (alln-opgw-3.cisco.com [173.37.147.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2E0A918000171
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:16:55 +0000 (GMT)
X-CSE-ConnectionGUID: puhLyE2OR9mu2RNnz3xyPQ==
X-CSE-MsgGUID: xX2U1Du9SMOXgAZ1OMTgDg==
Authentication-Results: alln-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208,217";a="46436078"
Received: from mail-co1pr07cu00103.outbound.protection.outlook.com (HELO CO1PR07CU001.outbound.protection.outlook.com) ([40.93.10.91])
  by alln-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 12:16:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmXWQlWd3JOqpK5LFwB/TKCy3yKcP9de8OJyYSKXCa0rAqJTPNn2uro/YbR/l8AJpc1k2+o7rXIibDSxmgt+nRnG+D//rVVvJIBxoUE0xiK2+3bCXtTvt8vnDuXQ8M9I/MVNDWe6wX4l/Rd18De/BcjNqV2ZhHcCkwdyPNe6bIDG8/AfQRtlDD/eanZFK56mUXTp+Oi0mDUBKbQxMSUpTISioW3hgf5LnVZ58yxwOluV/1H/g7S4ITr3kqOcOR2oxop0GjNSz6dDoplhdgwfZ6HpmvEH9x3E4TpaUWdFpYriUioU4+8uQ7bi7GnMuMFHvOIaT08sxiTmz0qieFw4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DKUBrYuLsN90AKsM/9s51ztmi3E6CisHL+xFrmARSM=;
 b=J0C3YjGj+DnlrdlfrW7EVldPTZQFz3CXrhUafg3dDPiPW8L0FjzKkY0smWuZqVrmcJKNm+VfuZs7Yvukf8cq0uyxCJWKiQcdLxAlrD8N/BKAZZw96kU9v+Reqo11lY5iT5CDTnUt6G4GM+tPWShWS6oHJlmdi9IemTDvQ/UlpsbpFaJBXGaV56XTH0QwpcqBvwf+5Xr/rxYUxIwuhh3vmOtez4ePDRCKfZzura4e70ezUwyXVEXWStVrlnKsJdWdB2PYpd7j9Y6U5enzM5FefX84RoyIQe8J3u+aMu3DLX6cXC70wXO6e90KW/U0/7sw22UIz/M/VtqzrZQi+v3V7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:16:52 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:16:52 +0000
From: "Matthew Ware (mattware)" <mattware@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Elliot Sparling (esparlin)" <esparlin@cisco.com>
Subject: RPM 6 in Wrynose
Thread-Topic: RPM 6 in Wrynose
Thread-Index: AQHcsIcBVqcb/yDdrEaJ311V201mRw==
Date: Tue, 10 Mar 2026 12:16:52 +0000
Message-ID: 
 <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7705:EE_|CH3PR11MB8444:EE_
x-ms-office365-filtering-correlation-id: 6111146e-da06-4acf-6c34-08de7e9ee987
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 zkMCe9NDf98oTP1f2a3/88mXxJ4753XAx2reAIvkJRudyO9mhb9z9dyYp9FvV4Gc2c1NHvFuPM9MV3p9IqahCci953rzkmi/jewHsaBe41Xp7bWsmMn0XColtw9Giuj4+pcrHQNjD/eRvmowW8qe5cCeTBGiBJvsuwGJ9oT7nagKBhZ/cIFCzbw0mi54h4J1hin/W8M8nc9WSsLO5GlL/ilwYLuZggTbvyllOO6QJVdfqjkwoNHeDMH/kMfGq8N1uneCY/7CoKrrBwTcVX3JcqgCU3PBwHNMATD3JPDxy6cdgKS1tz5DWqNdG5NKZf3MrIGvZ8AqVFy8HDXKNGt51aI0+FFKje1kk/j+owoZ/kPRRnQiJJckZR6qy8y5JfuivWo96eGrCjfd0+2vElN7E1bfUbP8q25hAN42KgSeC4tN/XZqD6V6Ah5TLv080lixgp9Ne1vBxiIzSDVZWRBeYv1ii5dMC+uAExuMro4HSco38hkkmaOM+wbt+UQj942ptx0zhgyIDnXTomTxrSBWfPiRaebcP1JZQaJjb8Ka0DuPxCTQGd+oWvAGNd8jo8HG/2jTL7f57Q3aqyGGnU2r8moaGAjm56WyZNL7WsZehuptBI04GaZFULw8fLlUPRm9WCNtP8BMjMTZmg+sTAf8jrzgMKv+G5kMsb+Zwku8Pil8VDlXgPmuwDve7weHvSenXaj9A9xVVB36v/VPtyQV3kr1ezvyhfd6DgYtVCKWGDUaIWLd80iBpyrq3Ue6ib3d6tkoRsST+xgVi4p+CJlYCsNultTiQKePCJ/wzXVEQ7Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?e9x1hUTXPDovfmqg2RRjtKrfMNJj+RnKpzdSXmXUXULTcY9YADdfgNQ82I?=
 =?iso-8859-1?Q?Tc4gb3NGAOA0KdmAhAUEZE142kk4i1OyEoyNxXFtaMLEKZCl5TCUT4vd27?=
 =?iso-8859-1?Q?YQ3mTfwwjOenPT701YM87Q2a1tgdQ+z0SoiJS25Swu7hLX06SKFL+ddSne?=
 =?iso-8859-1?Q?gnA8Fj6/awAP8Mxidqms0qvzR7XCxfu/hiIw+SCANQOThM14Ht5qgcIoiL?=
 =?iso-8859-1?Q?FPIzqZnpOuKwXAMTIFFuDLXwna6UdMH9ViQ3SbKDvYaN72pXdwGbgqZq2Y?=
 =?iso-8859-1?Q?7dqncoLZQl1mtBzrB5fW64MZuLbhAfWZKU/S9tQ4mq1xlM5r1XNEufwcEz?=
 =?iso-8859-1?Q?WHym/rve2KVxKgej8Nc1VW7nqgS8uARpRwyjXqYDHSoCzFeDNKfNpkgcJS?=
 =?iso-8859-1?Q?qdQpVm0WP9+amREcQNtnlYgB++aOdXHaknVa0RuTxTkFbsIrdkmcmncwG7?=
 =?iso-8859-1?Q?RPcq5rVfKfzmTCYlUk/48Q1h36hlkB/FN9fycBHMYbjDGoqYindXdE3b/4?=
 =?iso-8859-1?Q?tx0QPorhKoefbJGAQMeV/8XsWQiFGzxhwtTTQ6UQKq9M30KnYqhN1cexEz?=
 =?iso-8859-1?Q?S+TSwNd3phEmEdk4KbrZ/4Pb0SjeuT3cHO3hSXM3O0lyXWJ+dgKPaarW45?=
 =?iso-8859-1?Q?VwC07CLhsGsV+B8rBjXZ6AY4w0ytENeQgM62zX0IXAErHwxWbi9JdZfJJA?=
 =?iso-8859-1?Q?Yywm4q3APfdmrCtfOXcDniBWd48Lb0m2mPmVgwmStlUpf1qeJI9j6ZbMPL?=
 =?iso-8859-1?Q?cSabQ08U01gvE9bWhfTgl8G0IlKTrz3352Jpdqb8fQdHL7Ym4MukPQzG2Z?=
 =?iso-8859-1?Q?YEEGUOo2TWHCcYH1e5FOGleoKhHwxdgM8AFA8BdyY1XvUsfQIKooBpGvQY?=
 =?iso-8859-1?Q?rA7jPpIDzFNZSKyqMkdlUtdmAEd7xwErTqGV7pNNtOWR28h98kfAr8m8Ti?=
 =?iso-8859-1?Q?cO3A71MRbsvC4aHvpfwKgxFmO2chT9YJ2ZPS4plBjDAPiEsXKFhdbxcVjq?=
 =?iso-8859-1?Q?Q/qDyU9QJSX4JZD0MPnPCbkjsrXNGBnmj8BwtflNARIMmtVEfMqZ14YFOt?=
 =?iso-8859-1?Q?MnenP0zDUc2c0MR4GTxGBNkH7Llh2nVu+ZaHG/OYDbk70nHjDGv4EzmLt9?=
 =?iso-8859-1?Q?4YYqcLqLXqzv/Bmub4ElOeYJTSYo/kExl4kRTi5LDPvWePcbTfQOXTm38y?=
 =?iso-8859-1?Q?fiTlqedikpoKYjtoTJpACFBEUy6V3SLmEc/g6fmyRVrw8f8pEwKDhA2iic?=
 =?iso-8859-1?Q?jPtRqw3Gz642A+gfBhVcUECJ2cL/O/l0jAWqCJrSiptzFdTEUNOLErzcqL?=
 =?iso-8859-1?Q?4QWDPBf9paaoS8mttg06MaS/4xqGfmohxduwYfAWe39MkevUZz7gBjX0aM?=
 =?iso-8859-1?Q?zjtX9BzRxKoLIl+ZWHsfdz0jxeNQvTRZQXq3sdCrYsruZnSwjx0i2v2a6V?=
 =?iso-8859-1?Q?3DJZ63VdnawlY1iRGwxDFPNKlEmS6zeKEDt+Rz2h+1SsnacvSq5hkzvkFU?=
 =?iso-8859-1?Q?26EyCvCDibfL9hDy6iKlOze9ggduQQjyuX2EtCR8e8WXxhZA8pj8cFhpdn?=
 =?iso-8859-1?Q?yJxAuVVUggcnOYQFR9YXeuj2I1i7xkJ8y/nOUrcFnuIhF1INHHDRJDFuF3?=
 =?iso-8859-1?Q?tUrbHxqpjps80TmzN1SQSu4SoK+psz/rgCinSr2d1azTP5V9U1CFhuykFX?=
 =?iso-8859-1?Q?FRZykv2W2a34mUF5iDP0/ENDNSIDWk8brUfkF6RQTqIl1Ein9rgtVm9FnN?=
 =?iso-8859-1?Q?lf3wJFZMLnmdy9M9DSQw+WRnPgAiXIhg+nHuhwna4DcrwWBv6KBFYRvgsW?=
 =?iso-8859-1?Q?SHorzonhXjpZgWzdeeLO+V9G7dZikwpv3JTrQ+PWGiaEbfqjnTiU?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	IeC3SgrQqUopnqe0/qhLx9sDVSPSJlUdMRo+5Ogna4zxoQDecphM2yK3yMNgp70w9se6Cz+mJWSBChvP65DcNjrAzaFh5v8RD6MILFSa0YgvjXAs9PS/MNjpf6Ljvd2VKmfZhZFGGj8i2M8Zjdqf3g/pI8yZmcDrGJGPhCC4zTXNuW123Nhvmj8LG5/wbhZDxTjSaO+3B8ADu5HEllCm4s4avwuKbawSfPkzE+J2utCYZq7+Did2pAgfnzwZGIjLHy+mF+7+15tACn4QDKeiJR6Js61Qz9mGmYqWtNmwl1Yw3byDEt2BieQJgTOrXho1FxiYXpXcfft5efKoJMswQg==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6111146e-da06-4acf-6c34-08de7e9ee987
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 12:16:52.1070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7naL35LgSVDPMEkGfFnAVC8a+Sh49MbT0M8vo/KINV7iOC4EF+U5M0fDLunTSUTxpCGn2jvSIkJ9UOWzTLLtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-Outbound-SMTP-Client: 173.37.147.251, alln-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB770572B1859AB0B7EB592DE3CD46ASN7PR11MB7705namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232774

--_000_SN7PR11MB770572B1859AB0B7EB592DE3CD46ASN7PR11MB7705namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi OpenEmbedded folks,

I see that the next OpenEmbedded release, Wrynose, currently uses RPM 4.20.=
1, but that there are efforts to use RPM 6 instead. I was wondering, what i=
s the current state of the RPM 6 effort? Is it looking likely that Wrynose =
will take RPM 6?

Thanks,
Matt

--_000_SN7PR11MB770572B1859AB0B7EB592DE3CD46ASN7PR11MB7705namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi OpenEmbedded folks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I see that the next OpenEmbedded release, Wrynose, currently uses RPM 4.20.=
1, but that there are efforts to use RPM 6 instead. I was wondering, what i=
s the current state of the RPM 6 effort? Is it looking likely that Wrynose =
will take RPM 6?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Matt</div>
</body>
</html>

--_000_SN7PR11MB770572B1859AB0B7EB592DE3CD46ASN7PR11MB7705namp_--

