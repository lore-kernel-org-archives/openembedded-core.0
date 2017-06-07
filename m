Return-Path: <petter@technux.se>
Received: from bin-vsp-out-01.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2C96FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 20:46:12 +0000 (UTC)
X-Halon-ID: 55ff22f8-4bc2-11e7-b75a-005056917a89
Authorized-sender: petter@technux.se
Received: from webmail.binero.se (unknown [195.74.38.9])
	by bin-vsp-out-01.atm.binero.net (Halon Mail Gateway) with ESMTPA;
	Wed,  7 Jun 2017 22:46:09 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 07 Jun 2017 22:46:33 +0200
From: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
To: <openembedded-core@lists.openembedded.org>, Ross burton
	<ross.burton@intel.com>
Organization: Technux
Reply-To: <petter@technux.se>
Mail-Reply-To: <petter@technux.se>
In-Reply-To: <7c0aa8330757a50d9a69a4c23be83e4cc045566c.1494796923.git.petter@technux.se>
References: <cover.1494796923.git.petter@technux.se>
	<7c0aa8330757a50d9a69a4c23be83e4cc045566c.1494796923.git.petter@technux.se>
Message-ID: <52ce814f7d286b1687a40874eadb0646@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Subject: Re: [PATCH v2 1/1] multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR
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
X-List-Received-Date: Wed, 07 Jun 2017 20:46:13 -0000
Content-Type: multipart/alternative;
	boundary="=_6dae2f184753a1f86694dc4c078bac87"

--=_6dae2f184753a1f86694dc4c078bac87
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

 

Hi, 

Just realized this change was never merged into master, so see
this as a friendly reminder about this change-set (might have been lost
in the flood of changes in this time-frame). Not the most common use
case I guess, but would be good to finally get rid of the problem. If
you have any concerns about the change, please let me know. The solution
was briefly discussed with Richard on irc a couple of month ago, but if
someone thinks this should be solved in some other way, please initiate
a discussion :) 

BR Petter 

2017-05-15 06:17 skrev Petter Mabäcker:


> Due to the problem fixed in
> '56c677a multilib: Move redefinition
of STAGING_DIR_KERNEL'
> STAGING_KERNEL_DIR must be redefined for lib32
in multilib.bbclass.
> However this redefinition expanded
STAGING_KERNEL_DIR to an absolute
> path. This unconsciously added the
TMPDIR path in the sstate object,
> causing packages depended on
STAGING_KERNEL_DIR being rebuild if the
> TMPDIR was changed.
> 
> Solve
this by forcing the unexpanded TMPDIR variable to remain in the
>
beginning of STAGING_DIR_KERNEL (as default). Since TMPDIR is included
in
> BB_HASHBASE_WHITELIST, the sstate object will not be depended on
the
> expanded path anymore.
> 
> Signed-off-by: Petter Mabäcker
<petter@technux.se>
> ---
> meta/classes/multilib.bbclass | 4 +++-
> 1
file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git
a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index
ab04597..816f54e 100644
> --- a/meta/classes/multilib.bbclass
> +++
b/meta/classes/multilib.bbclass
> @@ -4,7 +4,9 @@ python
multilib_virtclass_handler () {
> if cls != "multilib" or not variant:
>
return
> 
> - e.data.setVar('STAGING_KERNEL_DIR',
e.data.getVar('STAGING_KERNEL_DIR'))
> + localdata =
bb.data.createCopy(e.data)
> + localdata.delVar('TMPDIR')
> +
e.data.setVar('STAGING_KERNEL_DIR',
localdata.getVar('STAGING_KERNEL_DIR'))
> 
> # There should only be one
kernel in multilib configs
> # We also skip multilib setup for module
packages.
> -- 
> 1.9.1
 

--=_6dae2f184753a1f86694dc4c078bac87
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html><body style=3D'font-family: Helvetica,Arial,sans-serif'>
<p>Hi,</p>
<p>Just realized this change was never merged into master, so see this as a=
 friendly reminder about this change-set (might have been lost in the flood=
 of changes in this time-frame). Not the most common use case I guess, but =
would be good to finally get rid of the problem. If you have any concerns a=
bout the change, please let me know. The solution was briefly discussed wit=
h Richard on irc a couple of month ago, but if someone thinks this should b=
e solved in some other way, please initiate a discussion :)</p>
<p>BR Petter</p>
<p>2017-05-15 06:17 skrev Petter Mab&auml;cker:</p>
<blockquote type=3D"cite" style=3D"padding-left:5px; border-left:#1010ff 2p=
x solid; margin-left:5px; width:100%"><!-- html ignored --><!-- head ignore=
d --><!-- meta ignored -->
<pre>Due to the problem fixed in
'56c677a multilib: Move redefinition of STAGING_DIR_KERNEL'
STAGING_KERNEL_DIR must be redefined for lib32 in multilib.bbclass.
However this redefinition expanded STAGING_KERNEL_DIR to an absolute
path. This unconsciously added the TMPDIR path in the sstate object,
causing packages depended on STAGING_KERNEL_DIR being rebuild if the
TMPDIR was changed.

Solve this by forcing the unexpanded TMPDIR variable to remain in the
beginning of STAGING_DIR_KERNEL (as default). Since TMPDIR is included in
BB_HASHBASE_WHITELIST, the sstate object will not be depended on the
expanded path anymore.

Signed-off-by: Petter Mab&auml;cker &lt;<a href=3D"mailto:petter@technux.se=
">petter@technux.se</a>&gt;
---
 meta/classes/multilib.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ab04597..816f54e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -4,7 +4,9 @@ python multilib_virtclass_handler () {
     if cls !=3D "multilib" or not variant:
         return
=20
-    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR'=
))
+    localdata =3D bb.data.createCopy(e.data)
+    localdata.delVar('TMPDIR')
+    e.data.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_D=
IR'))
=20
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
<span class=3D"sig">--=20
1.9.1
</span></pre>
</blockquote>
</body></html>

--=_6dae2f184753a1f86694dc4c078bac87--
