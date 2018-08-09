Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6C72274586
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 10:10:34 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id j205-v6so8893837oib.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=30WaRz73Ah4ZFXe0LRLH2fXg0CESlicl9haXqS4euCo=;
	b=QfQYMywqZQhNUL99ACA+46twgGcQ3mpwyn0GK83+4HSVeGUp4sRvyS5DZJ+PogYQcl
	Z3IYULKW21F0s3TYho64ZcPJoY+e2wVbMXyTIL1qs8f9MEBRtat//Sg5Dhz8UB3CW3pd
	4Xb7ajaY5vNdOVgH0laH4NotypB7l/qhTtDq+teT6PXUa8P4RDDCnLhS0bISjvW3w/zF
	N/i18d8S4BFF+zAzd0HlI7VeGmgol+VnlZMXcYvUuR8pqoiGs4QjAkV4hcWRfwZNU3ty
	bP9aO6GrKEKauwqbneZjDh4MpT2deq/Xd2Gta4Rfwy8FM1krMCkIhqdaC6CtCv05MuwQ
	Qh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=30WaRz73Ah4ZFXe0LRLH2fXg0CESlicl9haXqS4euCo=;
	b=Kcn6VRV7CDaoxjKh7pb7GRqE/Qgm7AKrY6RlL7FXH7MJauBtEMraWI/1ZXvnpGUc5g
	/bOVmETgtRf4JYK+uypLMaaAVcaUirDFNW8jP91HMcvUTpX/kYpYw80WDV1PegoHrQpa
	VTcbeT/qS7phlu89t9CZgZEDT4GU7q+FU0xyLd7+spfX8t7W2rHUiWEel3iI+O4GfAHa
	gO4QDQ1gS/DpWt7T5GmS6jWlK2tD4+QnIDvD92B3ypyCb6h7IKLgec2M9ct7gdZ2W+on
	D4An92l8fRehJ6bXZFan0e2cJChCkDcyKh6rI+JVrlWJRYsAUE/qxAkjn167M3QklVCU
	1MNw==
X-Gm-Message-State: AOUpUlFeFUXmdNjR4Z2c151k7lBaZF5+8MgH0jRGzCRXzl6ziXjwkr02
	pjftHw66Nc93XUyPSWSznBqCBo/oLzb5fA67kkwFOxKU
X-Google-Smtp-Source: AA+uWPyMUXOcbzfUC1z0nVEH80Whn2yIxnopMQOTE/j+zDsF7CT7e9m2H3On+WUR+JDjkGdAshvrY64QWz3RUyJwDiw=
X-Received: by 2002:aca:c40e:: with SMTP id
	u14-v6mr1333746oif.288.1533809435112; 
	Thu, 09 Aug 2018 03:10:35 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 9 Aug 2018 22:10:29 +1200
Message-ID: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: How to upgrade Qt modules in daisy branch
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
X-List-Received-Date: Thu, 09 Aug 2018 10:10:34 -0000
Content-Type: multipart/alternative; boundary="000000000000887eda0572fdd609"

--000000000000887eda0572fdd609
Content-Type: text/plain; charset="UTF-8"

Hi,

Our product is based upon 'daisy' branch (I know it's pretty old !) and now
we have a need to support BLE in it (typical business case).

My inner-self says it's the right time to upgrade everything but from
business unit point of view, best would be to upgrade "just enough" to get
BLE working.

So I upgraded Bluez4.101 to Bluez5.46 which went well but when I started
upgrading QtConnectivity from v5.4.1 to v5.11.0 then things started falling
apart.

It seems from v5.8 onward, Qt adopted new configuration system which is
causing configuration and compilation failures when building QtConnectivity.
Following change in recipe doesn't work.

-PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,bluez4"
+PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,bluez5"


Is there a way I can upgrade QtConnectivity to v5.11 while staying on daisy
branch ? Or is it just not possible to do so ?

Any help is appreciated.

Thanks
Ankur

--000000000000887eda0572fdd609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">Our product is based upon &#39=
;daisy&#39; branch (I know it&#39;s pretty old !) and now we have a need to=
 support BLE in it (typical business case).</div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">My inner-s=
elf says it&#39;s the right time to upgrade everything but from business un=
it point of view, best would be to upgrade &quot;just enough&quot; to get B=
LE working.</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">So I upgraded Bluez4.101 to Bluez5.46 whic=
h went well but when I started upgrading QtConnectivity from v5.4.1 to v5.1=
1.0 then things started falling apart.</div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif">It seems from v=
5.8 onward, Qt adopted new configuration system which is causing configurat=
ion and compilation failures when building QtConnectivity.</div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Followi=
ng change in recipe doesn&#39;t work.=C2=A0</div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif"><pre style=3D"white-spa=
ce:pre-wrap;color:rgb(0,0,0)">-PACKAGECONFIG[bluez] =3D &quot;CONFIG+=3DOE_=
BLUEZ_ENABLED,,bluez4&quot;
+PACKAGECONFIG[bluez] =3D &quot;-feature-bluez,-no-feature-bluez,bluez5&quo=
t;</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)"><br></pre></di=
v><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-se=
rif">Is there a way I can upgrade QtConnectivity to v5.11 while staying on =
daisy branch ? Or is it just not possible to do so ?</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif">=C2=A0=C2=A0<b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">Any help is appreciated.</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Thanks</div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Ank=
ur</div></div>

--000000000000887eda0572fdd609--
