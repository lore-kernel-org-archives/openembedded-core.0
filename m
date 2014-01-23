Return-Path: <sipke.vriend@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id D2B9C6B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:48:35 +0000 (UTC)
Received: from mail93-am1-R.bigfish.com (10.3.201.252) by
	AM1EHSOBE011.bigfish.com (10.3.207.133) with Microsoft SMTP Server id
	14.1.225.22; Thu, 23 Jan 2014 04:48:35 +0000
Received: from mail93-am1 (localhost [127.0.0.1])	by mail93-am1-R.bigfish.com
	(Postfix) with ESMTP id 91598203B7;
	Thu, 23 Jan 2014 04:48:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -3
X-BigFish: VPS-3(z579ehzbb2dI98dI9371I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h839h947hd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h190ch1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h209eh2216h2336h2438h2461h2487h24d7h906i1155h)
Received-SPF: pass (mail93-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail93-am1 (localhost.localdomain [127.0.0.1]) by mail93-am1
	(MessageSwitch) id 1390452508202638_21011;
	Thu, 23 Jan 2014 04:48:28 +0000 (UTC)
Received: from AM1EHSMHS005.bigfish.com (unknown [10.3.201.250])	by
	mail93-am1.bigfish.com (Postfix) with ESMTP id 2D0E622004A;
	Thu, 23 Jan 2014 04:48:28 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS005.bigfish.com
	(10.3.207.105) with Microsoft SMTP Server id 14.16.227.3;
	Thu, 23 Jan 2014 04:48:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W6CDE-0006KM-Mg; Wed, 22 Jan 2014 20:48:20 -0800
Date: Thu, 23 Jan 2014 14:48:07 +1000
From: Sipke Vriend <sipke.vriend@xilinx.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.1.9) Gecko/20100722 Eudora/3.0.4
MIME-Version: 1.0
To: <stefanx.stanacar@intel.com>
References: <1389876539-31534-1-git-send-email-stefanx.stanacar@intel.com>
In-Reply-To: <1389876539-31534-1-git-send-email-stefanx.stanacar@intel.com>
X-Originating-IP: [172.16.164.27]
X-RCIS-Action: ALLOW
Message-ID: <e7ee03fa-b951-4d84-afd9-3a0cb987b18f@AM1EHSMHS005.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oeqa: allow a layer to provide it's own TEST_TARGET class
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
X-List-Received-Date: Thu, 23 Jan 2014 04:48:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

I have started using this patch in master to extend test targets to our
bsp layer, and it works well. Thanks.
Will the extension of a controllers.py file work for multiple bsp layers
in a single build/conf/bblayers.conf?
I did a quick test and think that the first controller.py found is the
only one "extended". If this is true then  the current implementation
could get a false negative for a given TEST_TARGET, if more than one
layer implements controllers.py.

I tried a minor modification which assumes each testtarget class is in
its own file with the name <testtarget>.py (lower case). This extended
across multiple layers, assuming no duplication of test target names. I
put them in the utils directory for the test, but they could go into a
controllers folder as that might make more sense.

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.p=
y
index 757f9d3..d7cab7e 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -28,10 +28,11 @@ def get_target_controller(d):
          except AttributeError:
              # nope, perhaps a layer defined one
              try:
-                module =3D __import__("oeqa.utils.controllers",
globals(), locals(), [testtarget])
+                modulename =3D "oeqa.utils.{0}".format(testtarget.lower())=

+                module =3D __import__(modulename, globals(), locals(),
[testtarget])
                  controller =3D getattr(module, testtarget)
              except ImportError as e:
-                bb.fatal("Failed to import oeqa.utils.controllers:\n%s"
% traceback.format_exc())
+                bb.fatal("Failed to import
{0}:\n{1}".format(modulename,traceback.format_exc()))
              except AttributeError:
                  bb.fatal("\"%s\" is not a valid value for TEST_TARGET"
% testtarget)
          return controller(d)

Cheers
Sipke

On 16/01/2014 10:48 PM, Stefan Stanacar wrote:
> Allows a layer to define new classes in<layer>/lib/oeqa/utils/controllers=
.py
> and completely control or extend deployment of a target. (core currently
> has QemuTarget and SimpleRemoteTarget).
> The value of TEST_TARGET must be the name of the new class.
>
> Signed-off-by: Stefan Stanacar<stefanx.stanacar@intel.com>
> ---
>   meta/lib/oeqa/targetcontrol.py  | 23 +++++++++++++++++++----
>   meta/lib/oeqa/utils/__init__.py |  3 +++
>   2 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol=
.py
> index dee38ec..757f9d3 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -8,18 +8,33 @@ import os
>   import shutil
>   import subprocess
>   import bb
> -
> +import traceback
>   from oeqa.utils.sshcontrol import SSHControl
>   from oeqa.utils.qemurunner import QemuRunner
>
>
>   def get_target_controller(d):
> -    if d.getVar("TEST_TARGET", True) =3D=3D "qemu":
> +    testtarget =3D d.getVar("TEST_TARGET", True)
> +    # old, simple names
> +    if testtarget =3D=3D "qemu":
>           return QemuTarget(d)
> -    elif d.getVar("TEST_TARGET", True) =3D=3D "simpleremote":
> +    elif testtarget =3D=3D "simpleremote":
>           return SimpleRemoteTarget(d)
>       else:
> -        bb.fatal("Please set a valid TEST_TARGET")
> +        # use the class name
> +        try:
> +            # is it a core class defined here?
> +            controller =3D getattr(__name__, testtarget)
> +        except AttributeError:
> +            # nope, perhaps a layer defined one
> +            try:
> +                module =3D __import__("oeqa.utils.controllers", globals(=
), locals(), [testtarget])
> +                controller =3D getattr(module, testtarget)
> +            except ImportError as e:
> +                bb.fatal("Failed to import oeqa.utils.controllers:\n%s" =
% traceback.format_exc())
> +            except AttributeError:
> +                bb.fatal("\"%s\" is not a valid value for TEST_TARGET" %=
 testtarget)
> +        return controller(d)
>
>
>   class BaseTarget(object):
> diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init=
__.py
> index e69de29..8eda927 100644
> --- a/meta/lib/oeqa/utils/__init__.py
> +++ b/meta/lib/oeqa/utils/__init__.py
> @@ -0,0 +1,3 @@
> +# Enable other layers to have modules in the same named directory
> +from pkgutil import extend_path
> +__path__ =3D extend_path(__path__, __name__)
>



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.



