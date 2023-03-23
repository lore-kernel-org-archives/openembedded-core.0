Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EA2C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 10:13:09 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.68994.1679566385436977662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 03:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XVffD/jB;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1679566386;
  x=1711102386;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CW3hPZiCtooZ5NnuvGL86yw/FKpKJCTT07jWer5c75M=;
  b=XVffD/jBjhHWM3rT7csiq4MM5PzOfWanhE5slbZ9Me06SV2xDK6mMgw9
   fsnjjpFmdIKVJ0VXNilkakxJ4QNXylBR1y3xGgEO1G3TuUeIUY2K+v63/
   QlDi5W/sp3Z3IkK/k9GAjdzMZZmfb3hsCeEQnS0p1T07SdFWhk3Ne5c5Q
   4gSuJkPKf5O+kzDke7Ce9a9l8Gh7d+Q0lc0BvSXNd1YZmTSyuxePzinLy
   Wh3KKjpX3v4B+JPvyKNu650F+J/0Ji7n+Gh0YWSJA7xXsA3IJHRxJPIdS
   LfHilv+p+iiXW/KBNB2kyLyCBNK8h9LqyG16yXa6LTi0CxTkPSzvleWUh
   Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKB6IhUNN/3m8nkTAlf16zu2CSEyg8DQbkSYAYODtPdQ1BdEYd8NPOZvX/aQ+PvPQ9hf0pTQ1Jli6LFtRDC33T8CJg/rtj6uPfJXoAkiEYcFFToiJ5k+fgbVxbO6L7e+qPaG7IdeSaxdVFKyT8HSMiwOhpImA6yHxKyVNMSOkBfFoTKpcr9883BeFMRJ0vumfGGegKLzg1qptivkPHwgMwwh2qXWpKYSuw76Dx3G0NmB2yz/Jq/zMO5seQKO8BGVQv03ZXqA6bbMoCufXzyFhCn0aAL9Sp3U6UCdCq0jvx4jKR7wtnC8+fmwL04PhSbXTF+qGP9Retdvp0i5bksDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW3hPZiCtooZ5NnuvGL86yw/FKpKJCTT07jWer5c75M=;
 b=OJoQFBsUM4Uz9bKAnKnUrE8JLoZ3W9hyV1aHInngfdvn8mw5S0wc2KelK55nA6tnl6a+j2XhGBrFwtULiRTzv5mHn4KNCSH+GeMHKXUTWNe/qLAcAVuWMD2OjdgwukpGbeBGZdeD7oexW6m2X7AWpM+MnEcwtKlqHZPufDjeJjdyAdvfFOlqj9nJcQhiKV4jwmfkiRB7W6ojBrpbuBsl3WF0eGSCieDGPN/ji7TdXgvEXho+JXCN0yIqS4quvcQ5e9s+b+e9dC0SoHIXINDPcOtxU9OYcH52WV1ios8dUagtIW1pB/LANFxtjTaCRNGwTHeRfYFMd6eh/cBWFaoDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW3hPZiCtooZ5NnuvGL86yw/FKpKJCTT07jWer5c75M=;
 b=bEVwcKLxNXcnsY5mHi+crsk+pa6gLDDrb3SaWcyUmsQObZ0J+iGxAEiQUshwipx048qQ1AFp0uxlKUm77NAiMYBVOVjLKvxB87K9W+94F6mESEiYI6HAwE3EZqU7Ra2TrvQsL0Odrs3uOpQWZ+P8WrjRhn6waOhIyld8I+uPrz4=
From: Tobias Hagelborn <Tobias.Hagelborn@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
Thread-Topic: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating
 .sig files in detach_sign
Thread-Index: AQHZXW98x5WejftpJkaysCqd6RT7m68IJD12
Date: Thu, 23 Mar 2023 10:13:02 +0000
Message-ID: <DU0PR02MB8897CD32E08AC005E0F49F7FEC879@DU0PR02MB8897.eurprd02.prod.outlook.com>
References: <174F047FDC936771.19937@lists.openembedded.org>
In-Reply-To: <174F047FDC936771.19937@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR02MB8897:EE_|PAVPR02MB9404:EE_
x-ms-office365-filtering-correlation-id: 33b4f111-74f8-4663-820b-08db2b872f9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRoaCpQefX6kYEYjpJ1O8IplL6jnRMdoyOlziJWfSjbXcuIHsaCn5OTxpeHYVewwfHheqgxoUy7aLaSDUjmr51t/Sq2H9LSHl3IlTcQPLXFmHh9sWuhDzeO9KD2OxJSN6/KmwhJ1kZSWRW52AfrC9MHfY0o0D4mJh3VgQnXJe1RHGIXBgRPNcjVdpNss9ExfimPdJpMqBZ0KVOqcAlRk8QB4gVErHrEprQsf+KtJKPP2z9ajpG8IOlwYHrbLKnZBdOpLv8u/hGqm0QBDd3/JQ2365ysqd0iXZizixdpvmtZBciqVxu3tzBYGoaUL01OLjGevFB7eufUaruKaeR/1bGGE/WoKtVNnmRgI66ur+k7XzpkAFtIL12FT9fYSmXO1GG1kZvqX92wyTExU29F4lJOXiEjYECLdqILvqcK4A9ryjLoBSJ0E/2riGoYhnGQimLXaT3hm+PS+ot8l7Ysyzs/FCRtBD+2M3oxo+xnSkOrKM22sPwHkuhrUfYgXOBpYe3mDyOdHYg/K7JmVx9KuBm4mLquoY+qfW3vXyWpyrSN8/0gv65hm8nmTe+GpsylxGi6wrjHVlKLM9HkHOGvmALjJ+/9MaDRvf8P9A0Hj0SQbJcGtQeNNszUT9NTC/qTQFMc6ry5/l2wQ/kFrpK0rwV04VC4lb87mo9wfWiOqXcUzNuD4CuE0opPawW+PWXWPdGCbrbS/kp5r6JS8kJZ2yq5PLi7GHkESOYAbe/zmwCY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8897.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199018)(478600001)(91956017)(7696005)(316002)(71200400001)(66476007)(6916009)(66556008)(64756008)(66946007)(41300700001)(6506007)(53546011)(26005)(186003)(52536014)(9686003)(8676002)(66446008)(76116006)(8936002)(2906002)(5660300002)(83380400001)(55016003)(38070700005)(38100700002)(122000001)(86362001)(33656002)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cnoMaKTBQALYionti+T2lllvd/d/ie94jY/pSMbqRobvzZBI/pt6NG2+CA?=
 =?iso-8859-1?Q?6frqH0LaSHNxfSLd2lcgdDDXoo2B8o6Me5KNPiZ0vwsHPkPSOJwsPFjl33?=
 =?iso-8859-1?Q?Kt6naHK0uikCzYBUMneLvW+ugUbbjDrXCDgAf8cy4ET5tdcyPGo2neJInh?=
 =?iso-8859-1?Q?61jN/RKMtiR1p7+GqkpyEQboB5YOZxZ58KSPaVlyrGL+v06H8dSW6D/7wy?=
 =?iso-8859-1?Q?pACh8e8I8gFsTjSOSVv1BghbR3L0Yjjcz5xIA2zHdIlqzBkSulmz2EZfIZ?=
 =?iso-8859-1?Q?UBQ3FzXqO76VRWf73iEZ9F8iAYrMxsdt43EhEyYMhDqnbiwDmvMLb7ME6p?=
 =?iso-8859-1?Q?CQvqnDls2dN0qSKJI4ac7U1RoAHpiPReXNWEBffJHvi30Wr8h5BAB9a6rO?=
 =?iso-8859-1?Q?zUAL5UN/ntLgkYsPc8UR3pPfgt7hUFvT42Gdce8+FdjNZ17Ex1wTlUIWXd?=
 =?iso-8859-1?Q?Vqr/i1BoRe1FNtsnoscsI+g8hy4PHA2cHqsySCNvXxb1mjCaoBV9Ifqx7S?=
 =?iso-8859-1?Q?/IGuCGhJDYN+FzHuIqA3tVn96ANf05ExNdkiERmOK982zE3MG4HRyKeorc?=
 =?iso-8859-1?Q?pZ7WTJlQEAurvXSzIhp4tdQvBkLVwxHpo+seqP5DCxpwP4SbZ6ZvYn4JvL?=
 =?iso-8859-1?Q?mU+sVyF6myfuY145TaTVda/iqmKqaC32Ym+EDkdKYF4O9w+BkUvz70zexl?=
 =?iso-8859-1?Q?9PJOKFfzImMJpNYP7qHvupCsx/TQ0XY0TlKxXo5pf3P7D3h6cdofA192pZ?=
 =?iso-8859-1?Q?oWO9/Cbec8Fyygb6sut19o7z+LBeFAySKRa3HjT6GmrASXRzZOQpZPdbBb?=
 =?iso-8859-1?Q?Nlylh5lbhD+D1/xGJcUBYaknQasrWrVHNvoVvEXIRRabzSEfAcTmfAMUAn?=
 =?iso-8859-1?Q?JsTXkFjcxjdAfzm8g9BFo2nlHN3uLdqIA2etf/1KrxtvIe5cWgKcllnO38?=
 =?iso-8859-1?Q?NTdZtqaVlGgTWPaLJ+J9RqeDJyMaXkMowDKL5w5gPZwII6sK02w6gOJABi?=
 =?iso-8859-1?Q?wnhTUh3H5LrJUfsK4D7GtzApq89F4e8H9RGM/l0GU6XKBBFT4n0kgujJ62?=
 =?iso-8859-1?Q?hc9KoXa+f0iprfCY16bs47553GXMJMN4PPbWhDVojTiniYbQI3NE0Sfuiq?=
 =?iso-8859-1?Q?ISuslwD6XYzE3StIwnT4WtlrPVTSlVnVXuPak3gaJlcIYpWQjOAWfmLrPL?=
 =?iso-8859-1?Q?gsFOnAaOS9RqtyeZlAppi27L/z6TfPo48aETff/tIcXqsYHqzTKcse8I/K?=
 =?iso-8859-1?Q?whTDpTb959rAocgPyz005NCP1/EBOx6zpUlVKQ3yMyVnwI7kRIUoJwrNfb?=
 =?iso-8859-1?Q?yp+Fw2VBEQZRrrsyadpsmnfrnq3ifBeuEbmq7C71D4cSPCR3zh196d1Rtp?=
 =?iso-8859-1?Q?EDFUVPBN6MOb/CmdHkFHxeBcmnL7BHa0ww+T1ULYk2sK2wwbhQ/soKR8Ha?=
 =?iso-8859-1?Q?oCXSVTJgfeu4AyywzyeOXFkepo236Q7VTfHLDt+N7ZbHgcF3nsX6BjWeVO?=
 =?iso-8859-1?Q?aoLK0WBWMg7O6fkTN+WnlcX0THXPWKAQGvVq5tuNCpoJLmqrakVJNiWDK4?=
 =?iso-8859-1?Q?5NAq7lvs0xHLLkjS/uTff/04QpvNofrtMJGMS88glx7UKFvRdECbxSdE4W?=
 =?iso-8859-1?Q?sL4cuiPsgOcLE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8897.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b4f111-74f8-4663-820b-08db2b872f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 10:13:02.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6t0K3qwyNq7iT5Dp5nLYktBaGgcQKq7LNgVwKXfDlHMao6hYVDDCeBHawz4m3rUsJHj07g+QKMHouRZwBZolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9404
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 10:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178976

Some context to this:=0A=
=0A=
We run a shared state-cache and dockerized builds on large servers. Running=
 ~30 builds and ~200 parallel tasks using shared signed-sstate gives this t=
ype of error messages (stemming from corruption of the .sig files created):=
=0A=
=0A=
ERROR: packagegroup-<PACKAGE>-1.0-r0 do_populate_lic: GPG exited with code =
2: gpg: signing failed: Bad passphrase=0A=
=0A=
The provided solution with renaming the files into final destination has pr=
oven to eliminate the issue.=0A=
=0A=
Cheers=0A=
Tobias=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Tobias Hagelborn <Tobias.Hagelborn@axis.com>=0A=
Sent: Thursday, March 23, 2023 11:08 AM=0A=
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>=0A=
Subject: [OE-core] [PATCH] lib/oe/gpg_sign.py: Avoid race when creating .si=
g files in detach_sign =0A=
=A0=0A=
Move the signature file into place only after it is successfully signed.=0A=
This to avoid race and corrupted .sig files in cases multiple onging=0A=
builds write to a shared sstate-cache dir.=0A=
=0A=
Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>=0A=
---=0A=
=A0meta/lib/oe/gpg_sign.py | 25 +++++++++++++++----------=0A=
=A01 file changed, 15 insertions(+), 10 deletions(-)=0A=
=0A=
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py=0A=
index 613dab8561..868846cdc5 100644=0A=
--- a/meta/lib/oe/gpg_sign.py=0A=
+++ b/meta/lib/oe/gpg_sign.py=0A=
@@ -5,11 +5,12 @@=0A=
=A0#=0A=
=A0=0A=
=A0"""Helper module for GPG signing"""=0A=
-import os=0A=
=A0=0A=
=A0import bb=0A=
-import subprocess=0A=
+import os=0A=
=A0import shlex=0A=
+import subprocess=0A=
+import tempfile=0A=
=A0=0A=
=A0class LocalSigner(object):=0A=
=A0=A0=A0=A0 """Class for handling local (on the build host) signing"""=0A=
@@ -73,8 +74,6 @@ class LocalSigner(object):=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['--homedir', self.gpg_path]=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if armor:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['--armor']=0A=
-=A0=A0=A0=A0=A0=A0=A0 if output_suffix:=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['-o', input_file + "." + outpu=
t_suffix]=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if use_sha256:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['--digest-algo', "SHA256"]=
=0A=
=A0=0A=
@@ -83,19 +82,25 @@ class LocalSigner(object):=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if self.gpg_version > (2,1,):=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['--pinentry-mode', 'loopback=
']=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0=A0 cmd +=3D [input_file]=0A=
-=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 try:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if passphrase_file:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 with open(passphrase_file)=
 as fobj:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 passphrase =3D=
 fobj.readline();=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 job =3D subprocess.Popen(cmd, stdin=3Dsu=
bprocess.PIPE, stderr=3Dsubprocess.PIPE)=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (_, stderr) =3D job.communicate(passphra=
se.encode("utf-8"))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 output_file =3D input_file + "." + (outp=
ut_suffix or 'sig')=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 with tempfile.TemporaryDirectory(dir=3Do=
s.path.dirname(output_file)) as tmp_dir:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tmp_file =3D os.path.join(tm=
p_dir, os.path.basename(output_file))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ['-o', tmp_file]=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd +=3D [input_file]=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 job =3D subprocess.Popen(cmd=
, stdin=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (_, stderr) =3D job.communic=
ate(passphrase.encode("utf-8"))=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if job.returncode:=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bb.fatal("GPG exited with co=
de %d: %s" % (job.returncode, stderr.decode("utf-8")))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if job.returncode:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bb.fatal("GPG ex=
ited with code %d: %s" % (job.returncode, stderr.decode("utf-8")))=0A=
=A0=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 os.rename(tmp_file, output_f=
ile)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 except IOError as e:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bb.error("IO error (%s): %s" % (e.errn=
o, e.strerror))=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 raise Exception("Failed to sign '%s'" =
% input_file)=0A=
-- =0A=
2.30.2=0A=

