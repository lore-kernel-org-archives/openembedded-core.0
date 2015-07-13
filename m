Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 86888739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 16:23:05 +0000 (UTC)
Received: by qkcl188 with SMTP id l188so74397243qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WUj+42Pwpi7nZb0vPJuL2Y2AOkwH/RolPwVxM2ZqDls=;
	b=mRe2NslE2yhq9H0TxIYtt99rYnrefC8kwhHw/EUauJie/6T5aivHn9nf1eIq9ggmVV
	dZpP+Cuqjcb9dSIQYojqYiTKviJWeRPgeWGhu0sL8Vnk0k1KCKJfRPeiU7h4uTx5TCFL
	Kmf7yDp96V6zKeY6A8qpQqZAlJnxGuNqIq2AG3KafmVZz/shmP+FSyvw68jL6PrR7OZN
	2i5N0V63r7xNUSnbzsHN6GO+ztFPH7FNT86hxYH/Z76R2AHMSBxaLyyxUEQ83JlyDLDB
	BNlgx+wAr65C7G2r+9FcxR1D/l47LM4KcKNvC5yYcP5Vc/DFhx039+3rSKhRS/vf7s1b
	Sd4Q==
X-Received: by 10.55.33.78 with SMTP id h75mr23098683qkh.87.1436804585405;
	Mon, 13 Jul 2015 09:23:05 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 13 Jul 2015 09:22:45 -0700 (PDT)
In-Reply-To: <CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
	<CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
	<CABcZAN=z8xMuAABa54A8L2uFhC9fjRbZ36iszxSTJOpWcnFypw@mail.gmail.com>
	<CAEGpDubUdvEM=VHWzYqjBWoLz5Pz+2JP+j9oJLtdij-GSDamCg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jul 2015 09:22:45 -0700
X-Google-Sender-Auth: Ea1zoaZlyi0mMbbgrOgcePlH6MQ
Message-ID: <CABcZANmfHHYLE=-9dP2-LfQ-uF8WJMxugbGOEEbR-9WQu67j=g@mail.gmail.com>
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Cc: Pau Espin Pedrol <pau.espin@aweurope.be>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 13 Jul 2015 16:23:10 -0000
Content-Type: multipart/alternative; boundary=001a11400a2aecc3b7051ac42215

--001a11400a2aecc3b7051ac42215
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 9:17 AM, Pau Espin Pedrol <pespin.shar@gmail.com>
wrote:

> Because they are actually a different type of service files (system vs
> user) and they are handled in a different way by systemd. For
> instance, if you check the list of paths in which systemd looks for
> services, you can see that for system services it actually checks
> /lib/systemd/system, but it doesn't for user ones
> (/usr/lib/systemd/user):
>
>
> In systemd, src/shared/path-lookup.c:
>
>                 /* For the user units we include share/ in the search
>                  * path in order to comply with the XDG basedir spec.
>                  * For the system stuff we avoid such nonsense. OTOH
>                  * we include /lib in the search path for the system
>                  * stuff but avoid it for user stuff. */
>
>                 if (running_as =3D=3D MANAGER_USER) {
>                         if (personal)
>                                 unit_path =3D user_dirs(generator,
> generator_early, generator_late);
>                         else
>                                 unit_path =3D strv_new(
>                                         /* If you modify this you also
> want to modify
>                                          * systemduserunitpath=3D in
> systemd.pc.in, and
>                                          * the arrays in user_dirs()
> above! */
>                                         STRV_IFNOTNULL(generator_early),
>                                         USER_CONFIG_UNIT_PATH,
>                                         "/etc/systemd/user",
>                                         "/run/systemd/user",
>                                         STRV_IFNOTNULL(generator),
>                                         "/usr/local/lib/systemd/user",
>                                         "/usr/local/share/systemd/user",
>                                         USER_DATA_UNIT_PATH,
>                                         "/usr/lib/systemd/user",
>                                         "/usr/share/systemd/user",
>                                         STRV_IFNOTNULL(generator_late),
>                                         NULL);
>                 } else
>                         unit_path =3D strv_new(
>                                 /* If you modify this you also want to
> modify
>                                  * systemdsystemunitpath=3D in systemd.pc=
.in!
> */
>                                 STRV_IFNOTNULL(generator_early),
>                                 SYSTEM_CONFIG_UNIT_PATH,
>                                 "/etc/systemd/system",
>                                 "/run/systemd/system",
>                                 STRV_IFNOTNULL(generator),
>                                 "/usr/local/lib/systemd/system",
>                                 SYSTEM_DATA_UNIT_PATH,
>                                 "/usr/lib/systemd/system",
> #ifdef HAVE_SPLIT_USR
>                                 "/lib/systemd/system",
> #endif
>                                 STRV_IFNOTNULL(generator_late),
>                                 NULL);
>
> And also in systemd, src/core/systemd.pc.in:
>
> systemdsystemunitpath=3D${systemdsystemconfdir}:/etc/systemd/system:/run/=
systemd/system:/usr/local/lib/systemd/system:${systemdsystemunitdir}:/usr/l=
ib/systemd/system:/lib/systemd/system
>
> systemduserunitpath=3D${systemduserconfdir}:/etc/systemd/user:/run/system=
d/user:/usr/local/lib/systemd/user:/usr/local/share/systemd/user:${systemdu=
serunitdir}:/usr/lib/systemd/user:/usr/share/systemd/user
>
>
> So, pulseaudio is intended to be used as a systemd user service, not
> as a systemd system service, and that means it needs to end up in
> /usr/lib/systemd/user and not in /lib/systemd/system/.
>
> All these changes are part of my efforts to improve systemd user
> service support in OE, which is kind of bad nowadays imho.
>

Fair enough, thanks for the clarification. Given that systemd user services
require pam, and most embedded distros disable pam, I wonder if we
shouldn=E2=80=99t have an option, at least for daemons in recipes that can =
handle
it, to switch from user to system via a PACKAGECONFIG, and possibly default
that for the non-pam case.. Hmm.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11400a2aecc3b7051ac42215
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+T24gTW9uLCBKdWwgMTMsIDIwMTUgYXQgOToxNyBBTSwgUGF1IEVzcGluIFBl
ZHJvbCA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpwZXNwaW4uc2hhckBnbWFp
bC5jb20iIHRhcmdldD0iX2JsYW5rIj5wZXNwaW4uc2hhckBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bh
bj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgi
PjxkaXYgaWQ9IjozYSIgY2xhc3M9ImEzcyIgc3R5bGU9Im92ZXJmbG93OmhpZGRlbiI+QmVjYXVz
ZSB0aGV5IGFyZSBhY3R1YWxseSBhIGRpZmZlcmVudCB0eXBlIG9mIHNlcnZpY2UgZmlsZXMgKHN5
c3RlbSB2czxicj4NCnVzZXIpIGFuZCB0aGV5IGFyZSBoYW5kbGVkIGluIGEgZGlmZmVyZW50IHdh
eSBieSBzeXN0ZW1kLiBGb3I8YnI+DQppbnN0YW5jZSwgaWYgeW91IGNoZWNrIHRoZSBsaXN0IG9m
IHBhdGhzIGluIHdoaWNoIHN5c3RlbWQgbG9va3MgZm9yPGJyPg0Kc2VydmljZXMsIHlvdSBjYW4g
c2VlIHRoYXQgZm9yIHN5c3RlbSBzZXJ2aWNlcyBpdCBhY3R1YWxseSBjaGVja3M8YnI+DQovbGli
L3N5c3RlbWQvc3lzdGVtLCBidXQgaXQgZG9lc24mIzM5O3QgZm9yIHVzZXIgb25lczxicj4NCigv
dXNyL2xpYi9zeXN0ZW1kL3VzZXIpOjxicj4NCjxicj4NCjxicj4NCkluIHN5c3RlbWQsIHNyYy9z
aGFyZWQvcGF0aC1sb29rdXAuYzo8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBGb3IgdGhlIHVzZXIgdW5pdHMgd2UgaW5jbHVkZSBzaGFyZS8gaW4gdGhlIHNlYXJjaDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBwYXRoIGluIG9yZGVyIHRvIGNvbXBseSB3aXRo
IHRoZSBYREcgYmFzZWRpciBzcGVjLjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBG
b3IgdGhlIHN5c3RlbSBzdHVmZiB3ZSBhdm9pZCBzdWNoIG5vbnNlbnNlLiBPVE9IPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIHdlIGluY2x1ZGUgL2xpYiBpbiB0aGUgc2VhcmNoIHBh
dGggZm9yIHRoZSBzeXN0ZW08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCogc3R1ZmYg
YnV0IGF2b2lkIGl0IGZvciB1c2VyIHN0dWZmLiAqLzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGlmIChydW5uaW5nX2FzID09IE1BTkFHRVJfVVNFUikgezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChwZXJzb25hbCk8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1bml0X3BhdGggPSB1c2VyX2Rp
cnMoZ2VuZXJhdG9yLDxicj4NCmdlbmVyYXRvcl9lYXJseSwgZ2VuZXJhdG9yX2xhdGUpOzxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVsc2U8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1bml0X3BhdGggPSBzdHJ2X25l
dyg8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAvKiBJZiB5b3UgbW9kaWZ5IHRoaXMgeW91IGFsc288YnI+DQp3YW50IHRvIG1v
ZGlmeTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgKiBzeXN0ZW1kdXNlcnVuaXRwYXRoPSBpbjxicj4NCjxhIGhyZWY9Imh0
dHA6Ly9zeXN0ZW1kLnBjLmluIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5zeXN0
ZW1kLnBjLmluPC9hPiwgYW5kPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIHRoZSBhcnJheXMgaW4gdXNlcl9kaXJzKCkg
YWJvdmUhICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgU1RSVl9JRk5PVE5VTEwoZ2VuZXJhdG9yX2Vhcmx5KSw8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBVU0VSX0NPTkZJR19VTklUX1BBVEgsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7L2V0Yy9zeXN0ZW1kL3VzZXIm
cXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgJnF1b3Q7L3J1bi9zeXN0ZW1kL3VzZXImcXVvdDssPGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgU1RS
Vl9JRk5PVE5VTEwoZ2VuZXJhdG9yKSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsvdXNyL2xvY2FsL2xpYi9zeXN0
ZW1kL3VzZXImcXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7L3Vzci9sb2NhbC9zaGFyZS9zeXN0ZW1kL3Vz
ZXImcXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgVVNFUl9EQVRBX1VOSVRfUEFUSCw8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsvdXNy
L2xpYi9zeXN0ZW1kL3VzZXImcXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7L3Vzci9zaGFyZS9zeXN0ZW1k
L3VzZXImcXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgU1RSVl9JRk5PVE5VTEwoZ2VuZXJhdG9yX2xhdGUpLDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIE5VTEwpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZTxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVuaXRfcGF0aCA9IHN0cnZfbmV3KDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIElmIHlv
dSBtb2RpZnkgdGhpcyB5b3UgYWxzbyB3YW50IHRvIG1vZGlmeTxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBzeXN0ZW1kc3lzdGVtdW5pdHBh
dGg9IGluIDxhIGhyZWY9Imh0dHA6Ly9zeXN0ZW1kLnBjLmluIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5zeXN0ZW1kLnBjLmluPC9hPiEgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBTVFJWX0lGTk9UTlVMTChnZW5lcmF0b3Jf
ZWFybHkpLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFNZU1RFTV9DT05GSUdfVU5JVF9QQVRILDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy9ldGMvc3lzdGVtZC9zeXN0ZW0mcXVvdDss
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJnF1
b3Q7L3J1bi9zeXN0ZW1kL3N5c3RlbSZxdW90Oyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBTVFJWX0lGTk9UTlVMTChnZW5lcmF0b3IpLDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZxdW90Oy91
c3IvbG9jYWwvbGliL3N5c3RlbWQvc3lzdGVtJnF1b3Q7LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNZU1RFTV9EQVRBX1VOSVRfUEFUSCw8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDsv
dXNyL2xpYi9zeXN0ZW1kL3N5c3RlbSZxdW90Oyw8YnI+DQojaWZkZWYgSEFWRV9TUExJVF9VU1I8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVv
dDsvbGliL3N5c3RlbWQvc3lzdGVtJnF1b3Q7LDxicj4NCiNlbmRpZjxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFNUUlZfSUZOT1ROVUxMKGdlbmVy
YXRvcl9sYXRlKSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBOVUxMKTs8YnI+DQo8YnI+DQpBbmQgYWxzbyBpbiBzeXN0ZW1kLCBzcmMvY29yZS88
YSBocmVmPSJodHRwOi8vc3lzdGVtZC5wYy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+c3lzdGVtZC5wYy5pbjwvYT46PGJyPg0Kc3lzdGVtZHN5c3RlbXVuaXRwYXRoPSR7c3lz
dGVtZHN5c3RlbWNvbmZkaXJ9Oi9ldGMvc3lzdGVtZC9zeXN0ZW06L3J1bi9zeXN0ZW1kL3N5c3Rl
bTovdXNyL2xvY2FsL2xpYi9zeXN0ZW1kL3N5c3RlbToke3N5c3RlbWRzeXN0ZW11bml0ZGlyfTov
dXNyL2xpYi9zeXN0ZW1kL3N5c3RlbTovbGliL3N5c3RlbWQvc3lzdGVtPGJyPg0Kc3lzdGVtZHVz
ZXJ1bml0cGF0aD0ke3N5c3RlbWR1c2VyY29uZmRpcn06L2V0Yy9zeXN0ZW1kL3VzZXI6L3J1bi9z
eXN0ZW1kL3VzZXI6L3Vzci9sb2NhbC9saWIvc3lzdGVtZC91c2VyOi91c3IvbG9jYWwvc2hhcmUv
c3lzdGVtZC91c2VyOiR7c3lzdGVtZHVzZXJ1bml0ZGlyfTovdXNyL2xpYi9zeXN0ZW1kL3VzZXI6
L3Vzci9zaGFyZS9zeXN0ZW1kL3VzZXI8YnI+DQo8YnI+DQo8YnI+DQpTbywgcHVsc2VhdWRpbyBp
cyBpbnRlbmRlZCB0byBiZSB1c2VkIGFzIGEgc3lzdGVtZCB1c2VyIHNlcnZpY2UsIG5vdDxicj4N
CmFzIGEgc3lzdGVtZCBzeXN0ZW0gc2VydmljZSwgYW5kIHRoYXQgbWVhbnMgaXQgbmVlZHMgdG8g
ZW5kIHVwIGluPGJyPg0KL3Vzci9saWIvc3lzdGVtZC91c2VyIGFuZCBub3QgaW4gL2xpYi9zeXN0
ZW1kL3N5c3RlbS8uPGJyPg0KPGJyPg0KQWxsIHRoZXNlIGNoYW5nZXMgYXJlIHBhcnQgb2YgbXkg
ZWZmb3J0cyB0byBpbXByb3ZlIHN5c3RlbWQgdXNlcjxicj4NCnNlcnZpY2Ugc3VwcG9ydCBpbiBP
RSwgd2hpY2ggaXMga2luZCBvZiBiYWQgbm93YWRheXMgaW1oby48L2Rpdj48L2Jsb2NrcXVvdGU+
PC9kaXY+PGJyPkZhaXIgZW5vdWdoLCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBHaXZl
biB0aGF0IHN5c3RlbWQgdXNlciBzZXJ2aWNlcyByZXF1aXJlIHBhbSwgYW5kIG1vc3QgZW1iZWRk
ZWQgZGlzdHJvcyBkaXNhYmxlIHBhbSwgSSB3b25kZXIgaWYgd2Ugc2hvdWxkbuKAmXQgaGF2ZSBh
biBvcHRpb24sIGF0IGxlYXN0IGZvciBkYWVtb25zIGluIHJlY2lwZXMgdGhhdCBjYW4gaGFuZGxl
IGl0LCB0byBzd2l0Y2ggZnJvbSB1c2VyIHRvIHN5c3RlbSB2aWEgYSBQQUNLQUdFQ09ORklHLCBh
bmQgcG9zc2libHkgZGVmYXVsdCB0aGF0IGZvciB0aGUgbm9uLXBhbSBjYXNlLi4gSG1tLjxicj4t
LSA8YnI+PGRpdiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj5DaHJpc3RvcGhlciBMYXJzb248YnI+
Y2xhcnNvbiBhdCBrZXJnb3RoIGRvdCBjb208YnI+Rm91bmRlciAtIEJpdEJha2UsIE9wZW5FbWJl
ZGRlZCwgT3BlblphdXJ1czxicj5NYWludGFpbmVyIC0gVHNsaWI8YnI+U2VuaW9yIFNvZnR3YXJl
IEVuZ2luZWVyLCBNZW50b3IgR3JhcGhpY3M8L2Rpdj4NCjwvZGl2PjwvZGl2Pg0K

--001a11400a2aecc3b7051ac42215--
