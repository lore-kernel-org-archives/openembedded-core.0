Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0627F60248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 21:25:01 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id a203-v6so425033oib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=G5I4IDiPEHW5VGUus7Czjct4xspLQxMPWZeJUjlxx7c=;
	b=VbiBSphegjO4YB3I8BKMsuXgtVNWzGgsybOLPixJ1n6pS/LfHmHF8UdPY4vEBtz+EI
	29l8FyEtRhJTD+IqclyR+lx+mN6wfsNXR5atFq4bH9kUa+bc561melqt7tkPkgEhsuIt
	dK7aJmkR0TKO/Zzqenh/x7moKZuQrmE6cyo9FuEDSNqcjvVjoC2MasTTHlauvHffgG2A
	P/mubv8hgGxzxoePuLISMzk/FFl4jGjLJI7/7pj/ZmVKERObhkr4IfYUY4YEWSmm6/5J
	RsBvQVgt3pOGaVqNhFpHOuZugAWP+oz4hTEa40WPeJ7UGwa2KkMo8MPWYl8sWhOvOcIQ
	MB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=G5I4IDiPEHW5VGUus7Czjct4xspLQxMPWZeJUjlxx7c=;
	b=sQCXE+/ZONVDDlgyCOyvkneEyWc9Qxgi12X3btbQwK3mMrI4QGm4ewoGZSGxi5BYsp
	OX98b1Urr0x1mL26ReTJU2qSpZd3FeJKbjpzMKfpQ17L2FUVXHg+41bp1mg95iYnR6nO
	GZRVNyRECQ/fxqQc41d3YmtJmX9Qc/BNfXQtJXeGqzteXbjcIFQuomugKDIIm1LujjPq
	KXtL6zo7MGEKnrYKCO04fRBCcUjegxz8ZMpLGriKLF0yWHfrBpx57A+k4vFC+gJ65dq7
	t4R+JkuZudev1IvmIS6HtN1sHjBQh+8rh/RwUQUVdLZ+oi3BZvtGZhBXBhbxFJqJsGqj
	1Lhw==
X-Gm-Message-State: ABuFfojJAi3Eolnv6fdWa+Q6opGbbRM+yt06sMnXNJoEUVJw94bQKNNr
	BMxo1/HTeZyD9pzPBH5bkRM+2KLIMUs4cZAMyWxqC8o1
X-Google-Smtp-Source: ACcGV61LTEAFmSybKS6ltCKyjJCtTFtNs7IIIu7MZjCloQVeHCQ9TmtYFRPrRcEdvgTg5SYSHFYGAHzGc8i+3qwHpgs=
X-Received: by 2002:aca:ebcd:: with SMTP id
	j196-v6mr1677972oih.206.1537997102529; 
	Wed, 26 Sep 2018 14:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Wed, 26 Sep 2018 14:25:01
	-0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 26 Sep 2018 23:25:01 +0200
Message-ID: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Run experience with security flags enabled
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
X-List-Received-Date: Wed, 26 Sep 2018 21:25:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

from oe-core perspective my images are build on sumo (glibc 2.27). To
see what to expect, I enabled security flags (and yes some recipes in
my layers needed rework).

Now that I have an image, I thought: let's give it a run. Apart of
other issues (maybe later) I get on every startup an error message for
ldconfig.
systemctl ldconfig says:

=E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache
   Loaded: loaded (/lib/systemd/system/ldconfig.service; static;
vendor preset: enabled)
   Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:04
UTC; 2 days ago
     Docs: man:ldconfig(8)
  Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3DSEGV)
 Main PID: 136 (code=3Ddumped, signal=3DSEGV)

Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic
Linker Cache...
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main
process exited, code=3Ddumped, status=3D11/SEGV
Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with
result 'core-dump'.
Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild
Dynamic Linker Cache.

Again somebody else seeing similar / remembers a fix?

Help appreciated

Andreas

