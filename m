Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.6073.1586911668587209139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 17:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aiFzHUNo;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id i75so1615518ild.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 17:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=4MY7ijPwSXd3AJT1Veap4sN++locLLyrIk4kUvXuLoY=;
        b=aiFzHUNoydQ5U6ldyX87LBh/ZeH7hs3nfdzRP8vrnbgI0TSgaYcqiF5CbXENvIChdI
         /Hpmmnq3dUPlwg/qV04kIodOX5kHEylZUPYDOZKeiN+YSnVyc6VLYTLMBhYT+fdiLskT
         sx8CCjIEb13JYysk+TSO6+/mipotrC+dqxQYWSCMxgN3MuCwDMFiexiKyAPuphkEr8P6
         eru1UXfCLBHkiHCTvFrN/zefAHnxiAOpZOfgv7mROhZN6PZLq+Kkytktz9lPMVMcp8ss
         tgjG6hmCYZo9ltb8oFSpyNPFxWf+Tumf98FFR0RR47uZ+Hcwg3s+9vyv6WsqCmGZ+R3N
         E2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4MY7ijPwSXd3AJT1Veap4sN++locLLyrIk4kUvXuLoY=;
        b=adL7QN8bb7hgGnf4h49ftKvvml32m/4VH6BPBAOxCNKrcRWXNhxuVacyW17jryfbrU
         gzaOCnUxWIChAUoLe15V4LQ7xfT9bxBo5/Vlj94Og4zZ0OTFwe5VQmr4KHSc068d/Acp
         hx5GCix2lwa6uWwBInqH9laJhW7BRHdCeL9QTsOSvcRVOtnXTAi9QXIH0V9LjC0eB7Fp
         NES6bVAEd97TQfIdymAj1q6KdTekZRKdDq2b/1kUktm5ZI9jYvikKSBT8LoKKmK6Y5Zg
         0Pt17k+knwdNC5lfYFasLBY7r/i8dFrXYg/z0p+MYctnugqnDf3UBazA6uyHncZVPs9N
         hKRg==
X-Gm-Message-State: AGi0PuaL8AEnhnjZ7N1SOMG7bPX/X0xesy9sTGHi9U5FezdDqYaZyQhn
	S5jSyOtdZnaWqizgGeRT2WDJ7/fJ1zavGVJJSWKqTEkYvpc=
X-Google-Smtp-Source: APiQypJnE0j0OQzUtLESospRqL+khrT/XL0Maq72PzvRBJFfVSZaQx49d+EqLcYpkuEGCpYP5BZorCMgnUmrlTuzrFM=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr3183088iln.224.1586911667643;
 Tue, 14 Apr 2020 17:47:47 -0700 (PDT)
MIME-Version: 1.0
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Wed, 15 Apr 2020 02:47:35 +0200
Message-ID: <CALbNGRSvxc-Vv3YwJR0xGGQBNmU9NA3V4zCPZfQb17heZhi-cQ@mail.gmail.com>
Subject: Meson host_machine.system() incorrect on ARM?
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I have seen code snippets like this in 'meson.build' here and there
(this one is from gtk+3):

<snippet>
os_unix   = false
os_linux  = false
os_win32  = false
os_darwin = false

if host_machine.system() == 'darwin'
  os_darwin = true
elif host_machine.system() == 'windows'
  os_win32 = true
elif host_machine.system() == 'linux'
  os_linux = true
endif
</snippet>

Problem: In my environment

message(host_machine.system()) reports

| Message: linux-gnueabi

so os_linux remains unset. Seems most build do not do much with
variable os_linux but now I have a case

<snippet>
if os_linux or os_freebsd
  open_dir_cmd = 'xdg-open'
  find_program (open_dir_cmd)
elif os_darwin
  open_dir_cmd = 'open'
  find_program (open_dir_cmd)
elif os_windows
  open_dir_cmd = 'explorer.exe'
endif
cdata.set_quoted('OPEN_DIR_CMD', open_dir_cmd)
</snippet>

and that complains
| meson.build:162:6: ERROR: Unknown variable "open_dir_cmd".

Am testing it currently but what do experts think of

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 06034e8b47..167263f76c 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -68,6 +68,9 @@ def meson_operating_system(var, d):
     os = d.getVar(var)
     if "mingw" in os:
         return "windows"
+    # avoid e.g 'linux-gnueabi'
+    elif "linux" in os:
+        return "linux"
     else:
         return os

Comments welcome

Andreas
