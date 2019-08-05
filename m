Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 83CEC7F2C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 22:42:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 15:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="181805630"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2019 15:42:58 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Mon, 5 Aug 2019 15:42:58 -0700
Received: from orsmsx116.amr.corp.intel.com ([169.254.7.85]) by
	ORSMSX153.amr.corp.intel.com ([169.254.12.99]) with mapi id
	14.03.0439.000; Mon, 5 Aug 2019 15:42:58 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Seebs <seebs@seebs.net>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix openat()
	with a directory symlink [NAK]
Thread-Index: AQHVSLFamIwzp9G+KEeP09/EGnH90KbnbbGAgAEUsoCAAAsfgIAACdcAgAE7/wCAAB6OgIADOScT
Date: Mon, 5 Aug 2019 22:42:57 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64ED7F64C@ORSMSX116.amr.corp.intel.com>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>	<20190802124246.27d4beca@seebsdell>
	<CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>,
	<20190803092307.486e930d@seebsdell>
In-Reply-To: <20190803092307.486e930d@seebsdell>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2019 22:42:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I can reproduce the problem fairly easily  (and, sadly even with the latest=
 commits as 060058bb29f70b244e685b3c704eb0641b736f73 ). =0A=
In my case, it seems easy to reproduce if I have 40+ threads running.=0A=
The reproducer script (below) fails typically within the first 10 iteration=
s.=0A=
=0A=
=0A=
#!/bin/bash=0A=
=0A=
fname=3D'glibc-locale_master_august8'=0A=
max=3D1000=0A=
for (( i=3D1; i <=3D $max; i++ ))=0A=
do=0A=
    echo "$i/$max  ${fname}_$i.log"=0A=
    bitbake glibc-locale -c cleanall 2>&1 > /dev/null=0A=
    bitbake glibc-locale 2>&1 > ${fname}_$i.log=0A=
     if grep -q "host-user-contaminated" ${fname}_$i.log; then=0A=
        echo "error !"=0A=
      exit 2=0A=
    #else=0A=
      #rm ${fname}_$i.log=0A=
    fi=0A=
=0A=
done=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Seebs [seebs@seebs.net]=0A=
Sent: Saturday, August 03, 2019 7:23 AM=0A=
To: Khem Raj=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v2] pseudo: Upgrade to latest to fix openat()=
 with a directory symlink [NAK]=0A=
=0A=
On Sat, 3 Aug 2019 05:33:46 -0700=0A=
Khem Raj <raj.khem@gmail.com> wrote:=0A=
=0A=
> Will this fix the file ownership issue that we see with Glibc-locale=0A=
> packages from time to time?=0A=
=0A=
I have no idea. Since I haven't got a reliable reproducer for it, I=0A=
can't test it in a sane way.=0A=
=0A=
-s=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

