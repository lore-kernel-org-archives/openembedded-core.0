Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by mx.groups.io with SMTP id smtpd.web11.30895.1602466323230845795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 18:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=RiZW7nif;
 spf=pass (domain: gmx.com, ip: 212.227.17.20, mailfrom: douglas.royds@gmx.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1602466320;
	bh=nzocJafMOzAPhmtdXGLuPWNnCJRIgENzpttfdE/HpK0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RiZW7nifu8hID3XpaUtnLQUshNDcckI1OESTTw8haPfs2UaHWqjgvjgR5xBHTRUUl
	 utdpTRB+ypCKWi4sgcLYcpklW4nZOrl7htowMkmRQtcosVMAxyuFDrXihtd4JBN7fJ
	 Avb8KyobfrBx2tV9jb7NlFwM/Z2JWbhvkCv3AMzM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from acheron.taitradio.net ([202.37.96.2]) by mail.gmx.com (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MuDbx-1kD9kY3zvZ-00uVsK; Mon, 12
 Oct 2020 03:32:00 +0200
From: "Douglas Royds" <douglas.royds@gmx.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH v2] externalsrc: No single-task lock if S != B
Date: Mon, 12 Oct 2020 14:31:41 +1300
Message-Id: <20201012013141.473-1-douglas.royds@gmx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
References: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
X-Provags-ID: V03:K1:TH08byK8Z4adzyTilSmLzOE6uPYNek0WfMeOS2IPTmhh2xt0GDH
 YS6C2CUW15ItxX+p2/PBHyy1iv7lQ0pipgM1CFAQHhLpC6FGnTMNdG3dCqgPn9YzE45hTsv
 tvCzSSnCrkDHy+HFdoBadoJfEwyIslx339CEK04YFr4pEiLzhmxUsjJSwopJGNjZCJyBFdQ
 M30O/cmIEB28xPNbdUokA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bc2+ZJAPPdo=:bbqGhK3C5MGXhGSSiregQh
 fgYxmBiWiQpHb6wgyquFwEC3Q/oCJAJP0sgWySNABoyxF2PdhFHIqoc0734WQbu7SC10V8wvs
 WuWstVib6FFkobPel/FDa1Sd7Rf1aVHg25BTaRNAFuc0V7XnUqh+zao+eyzp9YTDWhU6jgP7B
 6fk6i9h0bEeIoy2JRUva2N4f2+pzHvWWq7VIB5DTjVlYQChV0VrLkL25pUAsciGI84A0lJTc8
 4APsw8cox7taTzg3P5boLTF8ao3LQYmxy1W+bxLuQGhA1Mbc44tGOXsS+y+3zReXuffgGDG0R
 oZP+a6fd/7mtnkZI5qpgNScoej9RrkrfjblikXdjpaktcP/ZuKeK5px4M9CJ2nU/jnfdrhUrb
 U/mqB/d1wX3g38RIZ7V4yVxM2dYO7eCUTTNYnr3gIYhBou6liX8Yc+38hvJ0P12rJKPmi31kG
 qABV7g5Lk/AaQSrXdbvuHijZFktkvfQ71PMObXLGLmi0QWdHK184tGYhg4enyu230IAaX7Nqi
 a8/hOrgoPTKXC06fWbzJZLwQlXl3lxolBreJ5fQ1afnr+no5H/3sTpyj99BwGriGihMPHZ1Co
 R+jlY+ugG1jAF5cdrsPjWdPGmjTjsebP2gWcyryonffDzBP930LAr60cehor20a9/0CVs6rCc
 iFp6hs6t+1IQASAXqnjPk+lVUcM+XxDrMQizQAnQAyIFN0g4WzKrAcgbUbBmmDgDiFZJOkPVK
 4jgf4jKSlqbHtBe7Tl4uC7F+EFi+6hHPDBgXqwtNV/f9bj8oZ6yz+H1w4ANCgEnOJ0cb2KtlP
 GLnxqsLO8Ym2rGbk3KF+k8isSmLerm0IcTjjggshxusZUJbiMiVrFICYlUGuB/+ExMVhuS5sB
 PzwYQN5KISSrwXPVMHKNMip5kemhIY9xBSbLqtV3Qn72UsbI8fVt+aGFVoFFr74i6Rjaj0Mm5
 hlzQCEgLnzeAjUCoegO1AiOQbIvyc9FfZ2jz9H+gzAf3ohqWTJ3aIqed8rFSlRXSUOfJYdM8s
 XatY0JNmfF4f4o8hdw1syhIgU0HQx0ETYD4nEYzSNhawfLnjv0T3miL6BF1nPDQoKEzDfn6xX
 jwuy8ylLFAO/YU/c6t79sPEO39X1t79BFRKkfu9WwN+xngufAHg8PKfblI1H3KXwSkWFeLjId
 b3EI4FtjF/AgdqWxWJqSsYh3RmJQ97wEAQj5wpgZK44UBelJZaUK0BnOTEhR9z69/5JFmq4r/
 jeLt1uSmm+avoeWMIhdwKHFUvMe+j766gtyuosA==
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
index 3618b99a86..88408add71 100644
=2D-- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -86,7 +86,7 @@ python () {
             if task.endswith("_setscene"):
                 # sstate is never going to work for external source trees=
, disable it
                 bb.build.deltask(task, d)
-            else:
+            elif os.path.realpath(externalsrc) =3D=3D os.path.realpath(ex=
ternalsrcbuild):
                 # Since configure will likely touch ${S}, ensure only we =
lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock=
")

=2D-
2.17.1

