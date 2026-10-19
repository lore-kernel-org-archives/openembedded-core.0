Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1A6CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 10:50:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31732.1792407013137952766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WVmHqGsI;
 spf=pass (domain: est.tech, ip: 52.101.70.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkg0m4/2ZfgInSpPAYclx63BXD7N6rUPeWIwlQY+RoJ8mQcJnigROuWGSeQxQskuqS+fsnpgKSa6p9/kgF96ppOBXwV/D0w7ILdAOYW34mBVS6L0U/bVdlxUDoCZUvsEKYO97gP5DZTXGllb9Z+Mv4hJBCrfpspUMZM5GuTH3UBXLHsQE1D9MXHTMnaDmWUErrxTmDMN4pdLXYVjlv94E7Rk1PWWxm101bIlPdxoQSwthTK2IIV8v1SvFqgxphrth9M/5DjlqmvlryLMUt6Fh1JREDyLJ65xmRWPYmpMmUsXDNzyImRW/dcOp8MqYH7fnVorIKWLe3GobZ83Ue8pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzvEzxrJi9vbrRfOybmde1yHBjQwfkcI8/rMPLLnqwA=;
 b=mdpgwyHvO5rb9S/VP8Xy4jZW6hKOzh/NhEnn+/l2h9BBeyFW+UBL7bTQljVf1EJwTug7RKm5sFNONqMv/yUMZOZ4RuLqLDSeR4YBwFkV2aWXwVQHXXavtKJ3+t67vVsQ70/rA1kNfm0GGphoGf7bjMkWZWbvGGCfnkRegy7zCc3Mg+TvcM5GC+X42NY0aexzKRFru6VIGwZbkd1FPowI8SD3i6mTpUoHRCzNyLOg3gtwfWfexPVPYUHdpPRhBgTkV8VcAuoMZH3LSA2GGx4J9H+DRYzR2TGO2uuG6weJ4zktqi4VWEkrCVLffrJeEKlAih3D3XkwuH8i6YGNP+ndPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzvEzxrJi9vbrRfOybmde1yHBjQwfkcI8/rMPLLnqwA=;
 b=WVmHqGsIFyzLIFIoOqjZlXDf0iINo+gXRRU7/wAa8COAmHe4TG1dL3Z6Dphd/sInv2IpM2U/pj2seBj90uNq5gOuSHGRO6dWnkOBCyahj4FvhnzyRLKcFgatozr5tG0Yky5xkul160zFbg1Xe43ZqBAcdnRXV2bZyd3qBuaQ4W+BE/HZ5Iitbo8o0LyswvJYNnzlwTTYtoYdIOLxxuShD22udTSjk9HRtAabsR5vdWrOMQiK3eMD7nNzjvmJF1aCB+kbrq6hVGXoQPqaxkSfdqkV7BHeZBC5teb8Bf+mgjodnjYdBfrxnKoWcvvHESxDizQccp6BMrCuWIhTogxYaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by FRZP189MB2760.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 10:50:05 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 10:50:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] python3-urllib3: Fix CVE-2026-97689
Date: Mon, 19 Oct 2026 12:50:02 +0200
Message-ID: <20261019105002.3471-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|FRZP189MB2760:EE_
X-MS-Office365-Filtering-Correlation-Id: 2507f657-f0ea-490d-3760-08df2dcebbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009221227099003|260925021911599003|260925021311599003|260925022911599003|261009223027099003|10067099003|56012099006|3023799007|6133799003|18002099003|13003099007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	FJOiQxwpno4ZjwX3ygysHaqUbpcdIrkXU+0SPGpTmVkr1FikuwbJPmTI6M5e/WAPINAiCspomWecLlJkf9gwjRl+kBqKWfH08waUIYL0qAGajJ3mIA1ZS5jQQTJfnqOy+XEtaRR+DWqTVUyYVsYQ2SftBQmVCOHfWlXc8GhVlWEo9VZO2BmFcx52pxxg2ZZvPir/9skSfHdT/6QnLb3UsBfGIr3UHNcnRNQrD7G+oHv8SEhmHScNAvMH74JmENXOprvF+CinprYOmv8sMSAW0yoDSizlPATaTxEz3qg/5Uq9QihANIsVSa8tiMAhI8aTnXsUJ9Q4pRb1BhqgFYZDgmottD6sbIoUHXnE0zGau+Ye2hchWUX5Q7gH1oSoWlalnuG3ydfed4BO04d3L2vF3vVs5Mc5gRltsSG8zTw/TOhTjA+iwzVhyNXSDa+Qdqe9Zdfb4rVf71r/YxB9TijO5DA7i+xHjhC7bAwISmVHgHrKM3/o54yI8TpdZDyY9nEXcJpuDMH6GnzBk/vfced2R7emjA7sKkiiyXMX81WmPAp0hD7F2wDM/IzyChIAxjkOZnkuH+k0jb4k+sjNAruEmhLDoGOFkkfG84Zznjajq5vzDsQSyd4Q3Sfb+VPYkE5gs3tVYxSQWA6OFpj3GhvjF9b4UDoMh04c86p4k+lDGPk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009221227099003)(260925021911599003)(260925021311599003)(260925022911599003)(261009223027099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(13003099007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y+S2Iij69yAfMZR2DaIrPqub2P4EFWJXbj/ysI1G5t4fx7uoncdTCXnvUfx4?=
 =?us-ascii?Q?egyb05o2FTBhnCypRAb99Xok/vMYUv1BTgzO/ciixzOVtY4dkI50d4AMdRHC?=
 =?us-ascii?Q?Fzu5q0jhfrTPgLsizdTAT8uDDqwLBo4x3fQoiafFQ1ZDG2OBAnGkrN+dicpn?=
 =?us-ascii?Q?y6u+KIKKO5EwtapccGiUXiCiuFvXgM7JVQJ704GyoC7UXUaHBNCn8HllxRCj?=
 =?us-ascii?Q?QqdYgrg5sUTeidquNrv44DTDMgTl/bQ0J8UBvQnxoUwmzUczUN5CGTUFWAjW?=
 =?us-ascii?Q?3+w92FqABcguSJnki/ikOAsM4CHsSo0gOMPj8Xt+P7rYBsdi13wGRo5WqNaF?=
 =?us-ascii?Q?ReIuA4UzEHVaogGdttOVpoYDjSXDuUk8DelaD1JMkqxDTFSJUa0ZTQvW61UT?=
 =?us-ascii?Q?rLr2I2R97g5S+3sClc6zQ51oMHCBchIgBKGU+jh6gLmdsxnuWSePee6K5R0P?=
 =?us-ascii?Q?eEUKeLLEatJPG6rXBvus2gHCdD7m3zdtpszOvqdWtrCWZoBpKHadDKW5bssl?=
 =?us-ascii?Q?WaUxMGX89e0nEaMWJ0/f9vaQRNnEWl90DMKSRyHU3U03oWL6wti7m6KphSNx?=
 =?us-ascii?Q?0YfXeww+fyvii+35TbEMD0EVMM8/BKh6wNKOZMwG8LZNGWzwbismrwX4WRrS?=
 =?us-ascii?Q?0bW5rvIHvhMB/GK1tUfCdEN/n8EkUx4JfdR9vCmARD+D2PmStkdcV8g5vuox?=
 =?us-ascii?Q?luTmtxmMlHLl70psQMeh6JTLS3GD9IsT+GxZEzXQQQzgX3qWfLIE3jxwAFnh?=
 =?us-ascii?Q?Sjb+j46rTK4ieA9769FeX4axaO0BPfuA++vlhjA0zvQM+OCuMZgNCYuXUcaP?=
 =?us-ascii?Q?b2u8ucHuhESJ7tGU5p5U5w4AcuUSCtYdHa4oCWjCAMUM3Nv470X2mLEAvaKM?=
 =?us-ascii?Q?84moXcHG2ImVGmLcoaAjGg2j5qcR9Fh+BNTf0pGrA+yU9jh9zXvErOHxqD5E?=
 =?us-ascii?Q?IM7dF16HMF/g5Rwv0OvaDOESSWZi50v1MfcK4HKWcILHMKRIPacHL2jQBk0T?=
 =?us-ascii?Q?WngLylfioFLV7zirfKKWfbYac//Cm4M4hOIcbZU7ikLsP5qdf0vJoYlt3iVs?=
 =?us-ascii?Q?GkrnqrwhMYvYeq4CQzpxvUXPjDHBJq70UYmZL31R44YXgVQ32fQeCFQZR49q?=
 =?us-ascii?Q?OFFWk9dCTCAYD6/ldG4FW4YYNXIWJTCMDm2VsmhnlONUnHbsgC39Oau04hZt?=
 =?us-ascii?Q?8Kyeao5jlAFVihc0miJ7GkTqJPid317uC5WUT7lrp924LZlhnrjhgfeuLfBu?=
 =?us-ascii?Q?nz0mNDeEL2h3yxzCfJR5LXC/3QnZ+KXJMHN6G+MNDXwquBV2UMsKdgc/+p8p?=
 =?us-ascii?Q?InQHtVCl3nxm9Qhad7jp+KKvlN1vAZMQboVHy5VMNZ+xLuJNhjAEkgrn0qzc?=
 =?us-ascii?Q?xEwTSO+dm0KFtvyXGRkjkrqKi/E1lUa2vNhlwOaxf7lHBbPN9EEzuSfZusvD?=
 =?us-ascii?Q?1/l8UXT6INQqnEbexC6dMXx9tjIg4l+e9wb391ZsZzss4S3w5bSWuArvSr6v?=
 =?us-ascii?Q?5IE2459LXLOnlHmzXO0aRwj0k7Ijf9W42wNneokuv3uDIJP3ww5mQ+sPpApA?=
 =?us-ascii?Q?0rpD1lPiOOc+S5rJhOjrikcd48dQZO6MZYu8+81KPEXpAsV2YCI3FYg+qHar?=
 =?us-ascii?Q?xv+ONmvL3tP8kekGXyUid0M5mHeu7pOipUyT9/bKE+ubwa1eGjAYOfI3Ib7Y?=
 =?us-ascii?Q?SLjZiRAst+LaspsOtkk4V4zFtNxjwYPg7pyJkOKmKsGu8jSXQzPqIuPFJcNq?=
 =?us-ascii?Q?Q50CRxEb8g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2507f657-f0ea-490d-3760-08df2dcebbc5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 10:50:04.8361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fADL0YikanHNX9YcVlH0I4RGliFF2658v20d2va5LJ3H4H57b74LSg0PiRqWdj5jA1K9UBOe2xEYHk72gjTfMUzZObOLh9/Iz0YrKzjldfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP189MB2760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248156

Backport the upstream fix [1] as mentioned in [2]

[1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5c52afb=
0b1b090f5ed
[2] https://nvd.nist.gov/vuln/detail/cve-2026-97689

Testing:
  - test_response.py::test_chunk_size_line_too_long - passed
  - test_response.py::test_chunk_trailer_line_length (6 cases) - passed
  - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buffer - =
passed
  - Full test_response.py: 161 passed, 45 skipped (no regressions)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++++
 .../python/python3-urllib3_2.6.3.bb           |   6 +-
 2 files changed, 254 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-9=
7689.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
new file mode 100644
index 0000000000..6e5e870c36
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.patch
@@ -0,0 +1,251 @@
+From e62cca8f9e4211fa005b238237509a1c669550ba Mon Sep 17 00:00:00 2001
+From: Quentin Pradet <quentin.pradet@gmail.com>
+Date: Tue, 15 Sep 2026 22:33:41 +0400
+Subject: [PATCH] Merge commit from fork
+
+* Bound chunk-size line reads to prevent memory exhaustion DoS
+
+The streaming chunked path (HTTPResponse.stream() / read_chunked()) read
+each chunk-size line with an unbounded readline(), unlike the plain read()
+path which delegates to http.client's _MAXLINE-capped reader. A malicious
+server could advertise Transfer-Encoding: chunked and then send a very lon=
g
+run of bytes with no newline, forcing the client to buffer the entire run
+before the chunk size could be rejected.
+
+This caps the chunk-size line (and the trailing CRLF line) at _MAXLINE,
+raising ProtocolError when exceeded, matching the behaviour read() already
+had. Only the size line is bounded; chunk bodies still go through the size=
d
+_safe_read(), so legitimate large chunks are unaffected.
+
+Verified with a local malicious server streaming a 200 MiB unterminated
+size line: stream() previously grew RSS by ~530 MB, now stays at ~1 MB and
+fails fast, matching read(). A 5 MiB chunk body still streams correctly.
+
+* Fix a black formatting issue
+
+* Test chunked response trailer length limits
+
+* Fix number in the changelog entry
+
+---------
+
+Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
+
+CVE: CVE-2026-97689
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/cd770=
b059b543be29298ea5c52afb0b1b090f5ed]
+
+Note:
+ - changeLog change is not backported
+ - Adjusted commit change as per 2.6.3 version
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/urllib3/response.py                   | 20 +++++-
+ test/test_response.py                     | 82 ++++++++++++++++++++++-
+ test/with_dummyserver/test_socketlevel.py | 34 ++++++++++
+ 3 files changed, 132 insertions(+), 4 deletions(-)
+
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index ff6d1f4..58f4587 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -50,6 +50,13 @@ if typing.TYPE_CHECKING:
+=20
+ log =3D logging.getLogger(__name__)
+=20
++# Maximum length of a chunk-size line (and the trailing CRLF line) when r=
eading a
++# chunked-transfer-encoded response. Matches ``http.client._MAXLINE`` so =
urllib3's
++# streaming path bounds these reads exactly like the stdlib ``.read()`` p=
ath does,
++# preventing a malicious server from forcing unbounded buffering (memory =
exhaustion)
++# via an unterminated chunk-size line.
++_MAX_CHUNK_LINE_LENGTH =3D 2**16
++
+=20
+ class ContentDecoder:
+     def decompress(self, data: bytes, max_length: int =3D -1) -> bytes:
+@@ -1330,7 +1337,12 @@ class HTTPResponse(BaseHTTPResponse):
+         # we'll try to read it from socket.
+         if self.chunk_left is not None:
+             return None
+-        line =3D self._fp.fp.readline()  # type: ignore[union-attr]
++        line =3D self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)  # type=
: ignore[union-attr]
++        if len(line) > _MAX_CHUNK_LINE_LENGTH:
++            self.close()
++            raise ProtocolError(
++                "Response chunk size line exceeded maximum allowed length=
"
++            ) from None
+         line =3D line.split(b";", 1)[0]
+         try:
+             self.chunk_left =3D int(line, 16)
+@@ -1438,7 +1450,11 @@ class HTTPResponse(BaseHTTPResponse):
+=20
+             # Chunk content ends with \r\n: discard it.
+             while self._fp is not None:
+-                line =3D self._fp.fp.readline()
++                line =3D self._fp.fp.readline(_MAX_CHUNK_LINE_LENGTH + 1)
++                if len(line) > _MAX_CHUNK_LINE_LENGTH:
++                    raise ProtocolError(
++                        "Response chunk trailer line exceeded maximum all=
owed length"
++                    )
+                 if not line:
+                     # Some sites may not end with '\r\n'.
+                     break
+diff --git a/test/test_response.py b/test/test_response.py
+index f55809f..b54a006 100644
+--- a/test/test_response.py
++++ b/test/test_response.py
+@@ -27,6 +27,7 @@ from urllib3.exceptions import (
+     SSLError,
+ )
+ from urllib3.response import (  # type: ignore[attr-defined]
++    _MAX_CHUNK_LINE_LENGTH,
+     BaseHTTPResponse,
+     BytesQueueBuffer,
+     HTTPResponse,
+@@ -1682,6 +1683,63 @@ class TestResponse:
+         assert isinstance(orig_ex, InvalidChunkLength)
+         assert orig_ex.length =3D=3D fp.BAD_LENGTH_LINE.encode()
+=20
++    def test_chunk_size_line_too_long(self) -> None:
++        # A malicious server can send a chunk-size line with no newline. =
urllib3's
++        # streaming path must reject it with a bounded read rather than b=
uffering
++        # the whole line (memory exhaustion). See GHSA / CVE for chunked =
DoS.
++        stream =3D [b"foooo"]
++        fp =3D MockChunkedEncodingLongChunkSizeLine(stream)
++        r =3D httplib.HTTPResponse(MockSock)  # type: ignore[arg-type]
++        r.fp =3D fp  # type: ignore[assignment]
++        r.chunked =3D True
++        r.chunk_left =3D None
++        resp =3D HTTPResponse(
++            r, preload_content=3DFalse, headers=3D{"transfer-encoding": "=
chunked"}
++        )
++        with pytest.raises(ProtocolError) as ctx:
++            next(resp.read_chunked())
++
++        assert "chunk size line exceeded maximum allowed length" in str(c=
tx.value)
++
++    @pytest.mark.parametrize(
++        "trailer_length",
++        [
++            _MAX_CHUNK_LINE_LENGTH - 1,
++            _MAX_CHUNK_LINE_LENGTH,
++            _MAX_CHUNK_LINE_LENGTH + 1,
++        ],
++    )
++    @pytest.mark.parametrize("line_ending", [b"\r\n", b""])
++    def test_chunk_trailer_line_length(
++        self, trailer_length: int, line_ending: bytes
++    ) -> None:
++        # The line limit includes its CRLF, but not the final blank line.
++        trailer =3D b"X:" + b"x" * (trailer_length - 2 - len(line_ending)=
) + line_ending
++        fp =3D BytesIO(b"3\r\nfoo\r\n0\r\n" + trailer + (b"\r\n" if line_=
ending else b""))
++        r =3D httplib.HTTPResponse(MockSock, method=3D"GET")  # type: ign=
ore[arg-type]
++        r.fp =3D fp  # type: ignore[assignment]
++        resp =3D HTTPResponse(
++            r,
++            preload_content=3DFalse,
++            headers=3D{"transfer-encoding": "chunked"},
++            original_response=3Dr,
++        )
++        chunks =3D resp.read_chunked()
++        assert next(chunks) =3D=3D b"foo"
++
++        if trailer_length > _MAX_CHUNK_LINE_LENGTH:
++            with pytest.raises(
++                ProtocolError,
++                match=3D"Response chunk trailer line exceeded maximum all=
owed length",
++            ):
++                next(chunks)
++        else:
++            assert list(chunks) =3D=3D []
++
++        assert fp.closed
++        assert r.isclosed()
++        assert resp.closed
++
+     def test_truncated_before_chunk(self) -> None:
+         stream =3D [b"foooo", b"bbbbaaaaar"]
+         fp =3D MockChunkedNoChunks(stream)
+@@ -1941,8 +1999,20 @@ class MockChunkedEncodingResponse:
+                 self.cur_chunk =3D self.cur_chunk[amt:]
+             return chunk_part
+=20
+-    def readline(self) -> bytes:
+-        return self.pop_current_chunk(till_crlf=3DTrue)
++    def readline(self, amt: int =3D -1) -> bytes:
++        # Emulate a real file object's readline(size): return bytes up to=
 and
++        # including the first newline, or at most ``amt`` bytes when ``am=
t >=3D 0``,
++        # whichever comes first.
++        if len(self.cur_chunk) <=3D 0:
++            self.cur_chunk =3D self._pop_new_chunk()
++        line =3D self.cur_chunk
++        newline_index =3D line.find(b"\n")
++        if newline_index !=3D -1:
++            line =3D line[: newline_index + 1]
++        if 0 <=3D amt < len(line):
++            line =3D line[:amt]
++        self.cur_chunk =3D self.cur_chunk[len(line) :]
++        return line
+=20
+     def read(self, amt: int =3D -1) -> bytes:
+         return self.pop_current_chunk(amt)
+@@ -1970,6 +2040,14 @@ class MockChunkedInvalidChunkLength(MockChunkedEnco=
dingResponse):
+         return f"{self.BAD_LENGTH_LINE}{chunk.decode()}\r\n".encode()
+=20
+=20
++class MockChunkedEncodingLongChunkSizeLine(MockChunkedEncodingResponse):
++    def _encode_chunk(self, chunk: bytes) -> bytes:
++        # A chunk-size line far longer than _MAX_CHUNK_LINE_LENGTH with n=
o
++        # newline, simulating a malicious server that never terminates th=
e
++        # size line (memory-exhaustion attack).
++        return b"f" * (2**16 + 1024)
++
++
+ class MockChunkedEncodingWithoutCRLFOnEnd(MockChunkedEncodingResponse):
+     def _encode_chunk(self, chunk: bytes) -> bytes:
+         return "{:X}\r\n{}{}".format(
+diff --git a/test/with_dummyserver/test_socketlevel.py b/test/with_dummyse=
rver/test_socketlevel.py
+index 016484d..d603b8a 100644
+--- a/test/with_dummyserver/test_socketlevel.py
++++ b/test/with_dummyserver/test_socketlevel.py
+@@ -2289,6 +2289,40 @@ class TestStream(SocketDummyServerTestCase):
+=20
+             done_event.set()
+=20
++    def test_chunked_size_line_too_long_does_not_buffer(self) -> None:
++        # A malicious server can advertise chunked encoding and then send=
 an
++        # unterminated chunk-size line (no newline). The streaming path m=
ust
++        # reject it with a bounded read instead of buffering the whole ru=
n,
++        # which would exhaust memory.
++        done_event =3D Event()
++        # Well above the 65536-byte cap, but small enough for a fast test=
.
++        run_length =3D 512 * 1024
++
++        def socket_handler(listener: socket.socket) -> None:
++            sock =3D listener.accept()[0]
++
++            buf =3D b""
++            while not buf.endswith(b"\r\n\r\n"):
++                buf +=3D sock.recv(65536)
++
++            sock.sendall(b"HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\=
r\n\r\n")
++            # A chunk-size line that never terminates with a newline.
++            with contextlib.suppress(OSError):
++                sock.sendall(b"f" * run_length)
++
++            done_event.wait(5)
++            sock.close()
++
++        self._start_server(socket_handler)
++
++        with HTTPConnectionPool(self.host, self.port, retries=3DFalse) as=
 pool:
++            r =3D pool.request("GET", "/", timeout=3DLONG_TIMEOUT, preloa=
d_content=3DFalse)
++            with pytest.raises(ProtocolError) as ctx:
++                next(r.stream(65536))
++            assert "chunk size line exceeded maximum allowed length" in s=
tr(ctx.value)
++
++            done_event.set()
++
+     def test_large_compressed_stream(self) -> None:
+         done_event =3D Event()
+         expected_total_length =3D 296085
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb b/meta/r=
ecipes-devtools/python/python3-urllib3_2.6.3.bb
index 5976c5c3b4..537a68cdab 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE =3D "https://github.com/urllib3/urllib3"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D52d273a3054ced561275d4d1526=
0ecda"
=20
-SRC_URI +=3D " \
-    file://CVE-2026-44431.patch \
-"
+SRC_URI +=3D "file://CVE-2026-44431.patch \
+            file://CVE-2026-97689.patch \
+           "
 SRC_URI[sha256sum] =3D "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991=
ac71ee15ad38ed"
=20
 inherit pypi python_hatchling

