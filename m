Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web10.1181.1602550148078569114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 17:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ebgO+xop;
 spf=pass (domain: gmx.com, ip: 212.227.15.15, mailfrom: douglas.royds@gmx.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1602550145;
	bh=cH9w7QG7nAuguZhXpkBxreTa+24/Q6RxPJ0OSRoRJdI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ebgO+xopvB9WJYlCUSf+Kw8h3dn7CGh5N9oknhSQSrdzC6NRygQ+weueoH6tqxm+/
	 G7t5Sg72Bnm17Vu6xdVSdUjP6DVm977qVO40XotIzck5rPL/XLApoqs0aUFDlqDfXX
	 vaL69Z+bFsD4KYHY729SV3eMNh/dOyoQTPGfw6cg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from acheron.taitradio.net ([202.37.96.2]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MxlzI-1kGMRy30KU-00zGEg; Tue, 13
 Oct 2020 02:49:05 +0200
From: "Douglas Royds" <douglas.royds@gmx.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH v3] externalsrc: No single-task lock if S != B
Date: Tue, 13 Oct 2020 13:48:56 +1300
Message-Id: <20201013004856.13388-1-douglas.royds@gmx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
References: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
X-Provags-ID: V03:K1:LN7j5xhI/uqmb7ucuapr+XxNX2OY0QnSvzK4DY71kBeUwvA7JQy
 d2umAz08IRfsOcMQRihhqU9D5QtE6WNtveE0L0Zduq3WLlVcWA4/eaoI/VYyg3y08TXteAr
 StdmnzWr0QIUAycSLl9mSEB4zFaAE3JB384N7k0xh2rClEW8KRbDw3QVYJmj7jMQMMcRlca
 LZkjY5d8hnlDgEb5uPwMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rJGJvCPkZgQ=:WSMjJytj/PUb1gQbnAI5Wv
 hB7P3ckbiYuuRnG7lsPayGdDN4mxxO+f8KnyTjyi5Ca+8iThZjkojU0x6BCAwZ6NFZMDtSAKs
 WQKbmoazOl3zYm2N+s4qxhI/7tZQjcu9B8VcKxLwh408erjM4GgO9id7Ry3fNw5VRbk8ixC+B
 +vEX3Jvh27M2F6QthwCEM2Vq8F0UKNknI0X8AfUq9FvnA1WoKkzvxcVgc9NBKVIcEAt9NYKW8
 M0JrMgOb7PbAoYdxqBzegQKuRBvw75Pb8tVb3LTyzRZKKRGrePj9U9b0JLKIZm1MzjAGB9z4l
 I7jGgK0LeRHs2Ngj1N/n8kZGc9r2AAwgnwSspxF3x3Edv+9vjF4S3JRqnM6lS3kumzMMz4Hy5
 jTzzf497bhJsMzeOY6oX7v1SSxxtjfJuJvv6sdyMr3l3wDBqxryeMqKxI/4SrTeDV0hS5uHw2
 GpnZqPlZ+ipmzLixeuOuD4nTdlKP6rE6lXYPKQKeLncPJ1H+O2vYO3nRdCp537ME97acow9pQ
 xh1IhasLgeRirGsG8H/cWl6dX0PW5GTo99UixbZq828UjoCP2tuLE97xbX62sWN01dTZSmi1m
 +uyZRXfUr1BBEiXs8QGnzWhnQhdzw6LvjJQWU4WnV3zUKamfrtiqq2reYrNfH4ae9p/E0qkAG
 i0ArOQYyW6ypvFhLtLEktssynyI2DqDJgg6SjXzXV67VgG/K7Vvn5EZsRovzRminbHmIjFgUj
 XZTAjQ15I4UFKhyEZAbZMMa2NLl1zuCtzlw78DtvA4NsVwOC2EJykLJ8aB3H4Fa4NxoNtm3wk
 gqbVf8na/il7jJ0Fsb5XhDef1sYI1y+c3/PjOsWd4CqcOFSbapfk9jy+7IAVqM9vz/5n2Lgv3
 54sVIrpDHTwdPs71HGEFN3ahRbQlzrXerZHQnHY6LMkV7Mes7QLjna5IkAKq2NPuewFODRyk5
 ZBWadMzbIpTRQq58OGQs2oLWs9jzF2Tpufy6ewpnIOJQWnezYpT17Zk2bcCFaJZ/cPbaIo/WN
 BsX0rGMD3FL4ymhQszHd70xywXFbTkUAuXRKn2ZC9EtjOkl19gXfRK+I9PqkLveLDeqGIJMXd
 CLxMWSVgJOLDJIqqsiKGHG+A4dafdT8pbPse3OlmsReIO3I4094MsiU/GV7hT0+wOBSicNbOi
 xt1IV7JQB7mqEX/5ZQlytmgwypatMcZ4vDdWMH8rxkwiVQB1B8ukXuedv9Ft8Tk6OrvBEbMkK
 BOlj3MyxeZLFHeoe2gPm4jSQaqjYTDyQ7PNAQVA==
Content-Transfer-Encoding: quoted-printable

From: Douglas Royds <douglas.royds@taitradio.com>

Allow different recipes to build things from the one external source tree =
in
parallel, but only if the build is happening outside the source tree.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
=2D--
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.b=
bclass
index d200129987..dd09395788 100644
=2D-- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -85,7 +85,7 @@ python () {
             if task.endswith("_setscene"):
                 # sstate is never going to work for external source trees=
, disable it
                 bb.build.deltask(task, d)
-            else:
+            elif os.path.realpath(d.getVar('S')) =3D=3D os.path.realpath(=
d.getVar('B')):
                 # Since configure will likely touch ${S}, ensure only we =
lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock=
")

=2D-
2.17.1

