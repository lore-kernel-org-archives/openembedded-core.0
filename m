Received: from outbound.pv.icloud.com (outbound.pv.icloud.com [57.103.64.119])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.274.1793036114619165937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=DAlFskIn;
 spf=pass (domain: subset.ch, ip: 57.103.64.119, mailfrom: patrick.wicki@subset.ch)
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id D4A1F180070E;
	Mon, 26 Oct 2026 17:35:12 +0000 (UTC)
X-ICL-RepId: 01a17947-d37e-75bd-b9f1-d6d925a2f506
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhICkMFWwBeC0kEQwVYEhVdRUMMQxlbE1JWRARUAFswSg1RHlIfHBNRWFUJChhHEkodR0NUAxICWkUBTV8OXh8EF0YZVQRHHl1WQxsZAlEcVg1XQ1QEX1BJDEFQbFoARxdIHV0ZWW9QXRwOHkIJQRVNVlAFFwZbFAREAV0FXQNAC04CWgRfAkYXSQdaAl4CQRRKHh1WH0AZWhMdGl4IWRl5C0YPRA5GXloQDU1DEkIVBBtGHkMEXy9dF14MXgU=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1793036114; x=1824572114; bh=K5Qs5OKovVNpfcuuVxt8SrjLO79yTnGDlws4SdWwods=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=DAlFskInxa/gnks561LDBEOVwS1sBrd04JkAEmIgLJno4SqY8vjc5toGTOf2gwC8ci1txd9j01/5BQ++whEx3lL8cARmmLA+yUm+JH8I7ettkGg6h85Ozldj0S8ogePMB9H2YBqtGCeNAOtGp4tO+HdxqyKYOzXXN8JeS/CSowZv6DfFxl2YnGqiLBSWhQY5tmDzcsUURzOJ8FjerdWnRSp96q62jC6X5LFeysjutYUb66PYKybLdtys/Oc8uNm24Q6N+QmDFpiEKGpZwCjMH+wfwbYXvG4oItCSmGIKKy03fcklGMJ4gv6VHrom8n0HA9QWrT5gLcDQPmolLjsw6Q==
mail-alias-created-date: 1663698038540
Received: from desk.internal (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 72BB618002A9;
	Mon, 26 Oct 2026 17:35:11 +0000 (UTC)
From: patrick.wicki@subset.ch
To: openembedded-core@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-networking][PATCH 2/2] squid: use /run instead of /var/run in tmpfiles.d
Date: Mon, 26 Oct 2026 18:34:06 +0100
Message-ID: <20261026173406.1475501-2-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026173406.1475501-1-patrick.wicki@subset.ch>
References: <20261026173406.1475501-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-ORIG-GUID: xk93KXLn5AWIv3RRi5VoK8IcPW4uYMn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MCBTYWx0ZWRfX2Zp7qRTrvKSC
 gi2TFxJfB5V9ZlYHMpKddHG8xE5tF2XvweNfwqI5QJtertx8t/oxeQNUHJH1M2//GKzdsxF4f1F
 mopqgDuU6TxWHKomIOrH/1Yq/XAKXJrBIjeVWzT5Vp0rxo4VHIMn5QqdhlKx94wd2n0oeFK7WhI
 P7m+/gBycT60V4Cg5+mY4syb3Qv+SinXeVvfuu4wSeBJ+alQI71SbdqUKJvhKgWZ6QGADFDlzvz
 qY5L3vAEtj9rYhx81Yck2fCptxnj97z/MUGmSrLvnebZdq0uuCxb/cwAWCWh6qdOF49DTo3S088
 aHn4ttl+KN5zUZGLmfEEBfVU6lMehMvdttk1WtUwC1LHOYlxuNmMdNsLyISpjM=
X-Authority-Info-Out: v=2.4 cv=Y8X1cxeN c=1 sm=1 tr=0 ts=6adf8f51
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=a_U1oVfrAAAA:8 a=EUgBE1UYJte-LVu3LvYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: xk93KXLn5AWIv3RRi5VoK8IcPW4uYMn5
X-JNJ: AAAAAAABJC/7hD16OrPe1CVYHZbnmZamSBWejF5qsnC/FHWfKvOYxosgeGMq3dABt5uUO4j2prV6PnT9cNYMZJn74EYTbg/567aAxU3O2+GvN8rqtfJsuDq+tRKtLGTisWli5B52kiRVFO96jA+jnnQYKS4UfM8EbgKqEXdENiHXMsrHROWxTAuVBxUvy4+IAjlVE45PkDa5tCvCZC+E72kdic/kISEHzev193cf3czmGUqGCaJC6YyRoIQoZfOFiniRyCdUOsjU+5dhBI6oiAEUEMhEFzV8wp8UIkG02K03w3U54C+jywYyUgNshkGxWQHy6RxxTxSyQqMiOo2zqmxxBdy5BaD8mkyWhMijORxWvatHx5xzeqbChRaKgs82r55pvuORF6Appo9tttRZQGNeuUfJjKmrXMMxYaEiFumhF8Cj0IFf3iiD8EZNC9ZZDgbyWqEjnvQ7LNFx52g1yA5i1Xgdxfp93Amv/uD8C8ynORLN1TjGTQDUEqIkzCD70jdp0BBhk9PQafuvc3H7ye7EZh6j2R3PVS2APkxdXxG9Wj9tI+EqUkD6bBoMsWwAATnv8b3BpDVn+FCm/kVTGOXtKMZS3ii/Bk9XeoJLzU7Tp5BKDKd52rCSnm9GX6PODe67A3uifQVRmLNmDbsUW019SI2ER3SuVD5zCEZqKd8Q/pPPHDrkZp5ubnKBVN9hLqxJegItAChSKPMqDBsHmQ60sA8+2bN1rO2wYeExHRgZrz500Rs/rLzWLfWFAZztFZNMjA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 17:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248688

From: Patrick Wicki <patrick.wicki@siemens.com>

systemd-tmpfiles warns about the legacy path:

  /etc/tmpfiles.d/squid.conf:1: Line references path below legacy
  directory /var/run/, updating /var/run/squid =E2=86=92 /run/squid; plea=
se
  update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-networking/recipes-daemons/squid/squid_7.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-ne=
tworking/recipes-daemons/squid/squid_7.7.bb
index bda8f124cb..7649342596 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.7.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.7.bb
@@ -122,7 +122,7 @@ do_install:append() {
=20
         # Configure tmpfiles.d
         install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d ${localstatedir}/run/${BPN} 0755 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
+        echo "d ${runtimedir}/${BPN} 0755 squid squid -" >> ${D}${syscon=
fdir}/tmpfiles.d/${BPN}.conf
         echo "d ${localstatedir}/log/${BPN} 0750 squid squid -" >> ${D}$=
{sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
=20
--=20
2.56.0

