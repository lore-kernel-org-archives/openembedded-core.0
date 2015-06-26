Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A5D0865C9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 01:27:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q1Rg5G002375
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jun 2015 18:27:42 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 18:27:42 -0700
Message-ID: <558CAA8D.1020305@windriver.com>
Date: Fri, 26 Jun 2015 09:27:41 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435224137.git.liezhi.yang@windriver.com>
	<8389e233505ed188fb41513d0f745a4b84874b6d.1435224137.git.liezhi.yang@windriver.com>
	<CAJTo0LbkB2+oGC1wwj3yNWVV6Bz74uuzXPD4co17gqmz-Kq6ag@mail.gmail.com>
In-Reply-To: <CAJTo0LbkB2+oGC1wwj3yNWVV6Bz74uuzXPD4co17gqmz-Kq6ag@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] runqemu: disable graphic when no DISPLAY
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
X-List-Received-Date: Fri, 26 Jun 2015 01:27:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/25/2015 08:13 PM, Burton, Ross wrote:
>
> On 25 June 2015 at 10:24, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +if [ -z "$DISPLAY" -o "$GRAPHIC" = "no" ]; then
>
>
> Does this break people using QEMU without SDL that connect to it using VNC?

It doesn't break it, but there is a little different, now both the text
console and graphic vnc server will start, the text console didn't start
before this patch. I'm not sure which is better, I've made another patch
to make it work as before, and put the patches here, you can decide which
one to use.

   git://git.openembedded.org/openembedded-core-contrib rbt/qemu_v2

diff --git a/scripts/runqemu b/scripts/runqemu
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -70,6 +70,8 @@ SCRIPT_KERNEL_OPT=""
  SERIALSTDIO=""
  KVM_ENABLED="no"
  KVM_ACTIVE="no"
+GRAPHIC="yes"
+PUBLICVNC="no"

  # Determine whether the file is a kernel or QEMU image, and set the
  # appropriate variables
@@ -142,8 +144,7 @@ while true; do
         ISOFS=true
         ;;
          "nographic")
-            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
-            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+            GRAPHIC="no"
              ;;
          "serial")
              SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial stdio"
@@ -187,6 +188,7 @@ while true; do
              ;;
          "publicvnc")
              SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
+            PUBLICVNC="yes"
              ;;
          "") break ;;
          *)
@@ -291,6 +293,13 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
      fi
  fi

+# Disable graphic when no DISPLAY or -nographic is specified.
+if [ "$GRAPHIC" = "no" ] || [ -z "$DISPLAY" -a "$PUBLICVNC" = "no" ] ; then
+    echo "Disabling graphic."
+    SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
+    SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
+fi
+
  machine2=`echo $MACHINE | tr 'a-z' 'A-Z' | sed 's/-/_/'`
  # MACHINE is now set for all cases


// Robert

>
> Ross

