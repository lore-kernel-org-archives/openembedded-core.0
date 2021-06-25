Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.1532.1624584566608821785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 18:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mLXeQKuKt5SDqKKFLsyP3r/04CtkDm2EPv7+F1s1lxPV7YgGigGNQlD+mWQd/D/gQMpHC4UlDr
 1Pe8Djp3ribg==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207527125"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; 
   d="scan'208";a="207527125"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 18:29:25 -0700
IronPort-SDR: zPkilbSXpTei5wVxRkICFyecO+yu71ygxC6gjSSkYFa7/X8ad+H4tnXWbOXnhLwMagk8Q//cxB
 iCDnE/2SGaNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; 
   d="scan'208";a="474712716"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jun 2021 18:29:24 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 25 Jun 2021 09:29:23 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Fri, 25 Jun 2021 09:29:23 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: Minjae Kim <flowergom@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH] rpm: fix CVE-2021-3421
Thread-Topic: [OE-core] [dunfell][PATCH] rpm: fix CVE-2021-3421
Thread-Index: AQHXaPzw4crtuhyjzkmDvoLjFs6/Sqsj7x8g
Date: Fri, 25 Jun 2021 01:29:23 +0000
Message-ID: <cc3503555b1342edbb4ec76dc7595fcf@intel.com>
References: <20210624132904.873-1-flowergom@gmail.com>
In-Reply-To: <20210624132904.873-1-flowergom@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> + 	    /* Bump reference count for return. */ diff --git a/lib/rpmtag.h
> +b/lib/rpmtag.h index 8c718b31b5..d562572c6f 100644
> +--- a/lib/rpmtag.h
> ++++ b/lib/rpmtag.h
> +@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
> +     RPMTAG_LONGARCHIVESIZE	=3D RPMTAG_SIG_BASE+15,	/* l */
> +     /* RPMTAG_SIG_BASE+16 reserved */
> +     RPMTAG_SHA256HEADER		=3D RPMTAG_SIG_BASE+17,	/* s */
> ++    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
> ++    /* RPMTAG_SIG_BASE+19 reserved for
> RPMSIGTAG_FILESIGNATURELENGTH
> ++ */
> +
> +     RPMTAG_NAME  		=3D 1000,	/* s */
> + #define	RPMTAG_N	RPMTAG_NAME	/* s */
> +@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
> +     RPMSIGTAG_LONGSIZE	=3D RPMTAG_LONGSIGSIZE,	/*!< internal
> Header+Payload size (64bit) in bytes. */
> +     RPMSIGTAG_LONGARCHIVESIZE =3D RPMTAG_LONGARCHIVESIZE, /*!<
> internal uncompressed payload size (64bit) in bytes. */
> +     RPMSIGTAG_SHA256	=3D RPMTAG_SHA256HEADER,
> ++    RPMSIGTAG_FILESIGNATURES            =3D RPMTAG_SIG_BASE + 18,
> ++    RPMSIGTAG_FILESIGNATURELENGTH       =3D RPMTAG_SIG_BASE + 19,
> + } rpmSigTag;
> +

Was this hunk added to make the backported patch compile? Considering 4.14.=
x version doesn't use RPMSIGTAG_FILESIGNATURES at all, I am wondering if th=
is change works as intended?

Thanks,

Anuj   =20
