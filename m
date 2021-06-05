Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.9381.1622874699706434740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MdPtIPNE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c9so2688053wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 23:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=wiiy76Li+wl1Em3CxM7lHmpWAtkd2+EW63QTyI/5PfU=;
        b=MdPtIPNEbE3CN12IdcZto/++89GOR07NCodj0wUNa278hInbb5fFcQ3jH2U+eqBZwF
         NQPaT6oxsQ6zc0JFYR0m/r1aZG5dv+ltkMD7TTjK23bydNfzVHWWZ+ZmXljey2G4xhBM
         4QcLudhE4/Qriojj+jjAiC9cgtU7q+PPbOcx5iC7XY+gLK+S01M6has4GZG/VOmh4oVk
         U6FifDyKTJot1NCk+YIFUcMV4bQXkOL3gV6BAz1jiriKT915aKYebZvq2c4DZAI94yOV
         h1PnyVu9Pxakipz8e21uApOb7xVnsSUTu6wJrLwm322baRA3K93XvKyg+jXJIPRTv9dD
         tDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=wiiy76Li+wl1Em3CxM7lHmpWAtkd2+EW63QTyI/5PfU=;
        b=Sc1za94fhaeOrxaazqCh1m7oGo5DiOC8i8up7TS7rumkO04fa24/wPINVFlqqp4b/y
         Dw/JjjdgGZ6UAQRHAnaKmNOnAFQIhS1D4aWS1x84GfMS/aOBKsnQq8sLsXuvGDeFC9sL
         mCsjgvslhT/ZsXg/63rhWlZNkzbzIGvlU5b0aQwEt/oECtb0WjtVyMEKij/h6SEREmOo
         miD1KddRRvs+9LRmOm4cQiHPhWRARO3xojjyjwEFt/UWYUEdZ9idBUiH+aL1xyhBipbg
         cXvCPZpOOHrkDjV2A9FhAT0bAfGR1k0t56UVfD2ogNpZzjDxEO5z7KcmSxO1g9uM3lz6
         ah0Q==
X-Gm-Message-State: AOAM530uQUH7hwhhLowhL55b5B5uh7JjfSu4WHnwl8YHCp+VBkDYgT1c
	htvSKF1NhJbcP9kMeY3frAk+9Pl8s2RLIP+Z
X-Google-Smtp-Source: ABdhPJw2hT9PZccKD9ho3Q4M1KuCZVpGl5vTbNFuuOZDeH51EajKl6kYEOag7Bq3QckLx8e9VePwTg==
X-Received: by 2002:adf:ba07:: with SMTP id o7mr3995009wrg.160.1622874697882;
        Fri, 04 Jun 2021 23:31:37 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([37.120.204.197])
        by smtp.gmail.com with ESMTPSA id z3sm9257521wrl.13.2021.06.04.23.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 23:31:37 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Ayoub Zaki <ayoub.zaki@embexus.com>,
 openembedded-core@lists.openembedded.org
References: <20210603142106.115932-1-uvv.mail@gmail.com>
 <e82221f4-deeb-3cb2-037c-d5672a19a006@embexus.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <218ce6cb-d4a7-6d5f-f993-0cbabc929677@gmail.com>
Date: Sat, 5 Jun 2021 08:31:36 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e82221f4-deeb-3cb2-037c-d5672a19a006@embexus.com>
Content-Type: multipart/alternative;
 boundary="------------4210AFEDC65A95618E8B052A"
Content-Language: en-US

--------------4210AFEDC65A95618E8B052A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayoub,
Thanks for the hint. I knew the recipe exists, but I didn't know it uses 
overlay.

I did have a closer look at the mount-copybind script, and it uses 
overlay indeed, but it seems it's used for the other purpose. Originally 
the recipe provided only bind-mount functionality, they added overlayfs 
support later to save on space.

I tried to use the recipe with my use case, but it turns out that 
reverses the options of mount command in mount-copybind. I'm also not 
sure how the dependencies should be injected into the mount unit.

Vyacheslav

On 04.06.2021 22:20, Ayoub Zaki wrote:
>
> Hi,
>
>
> volatile-binds (maybe the *volatile* naming is misleading) recipe in 
> yocto is already doing that, just to be appended .ie:
>
> VOLATILE_BINDS += "\
> /data/lib/systemd/network /lib/systemd/network\n\
> /data/home/root /home/root\n\
> "
>
> It will generate for each overlay a mount point service.
>
> BR
>
> On 6/3/21 4:21 PM, Vyacheslav Yurkov wrote:
>> It's often desired in Embedded System design to have a read-only rootfs.
>> But a lot of different applications might want to have a read-write access
>> to some parts of a filesystem. It can be especially useful when your update
>> mechanism overwrites the whole rootfs, but you want your application data
>> to be preserved between updates. This class provides a way to achieve that
>> by means of overlayfs and at the same time keeping the base rootfs read-only.
>>
>> Signed-off-by: Vyacheslav Yurkov<uvv.mail@gmail.com>
>> ---
>>   meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>   create mode 100644 meta/classes/overlayfs.bbclass
>>
>> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
>> new file mode 100644
>> index 0000000000..7fac3e696e
>> --- /dev/null
>> +++ b/meta/classes/overlayfs.bbclass
>> @@ -0,0 +1,132 @@
>> +# Class for generation of overlayfs mount units
>> +#
>> +# It's often desired in Embedded System design to have a read-only rootfs.
>> +# But a lot of different applications might want to have a read-write access to
>> +# some parts of a filesystem. It can be especially useful when your update mechanism
>> +# overwrites the whole rootfs, but you want your application data to be preserved
>> +# between updates. This class provides a way to achieve that by means
>> +# of overlayfs and at the same time keeping the base rootfs read-only.
>> +#
>> +# Usage example.
>> +#
>> +# Set a mount point for a partition overlayfs is going to use as upper layer
>> +# in your machine configuration. Underlying file system can be anything that
>> +# is supported by overlayfs
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
>> +#
>> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
>> +# BSP and installed to the image.
>> +#
>> +# Then you can specify writable directories on a recipe base
>> +#
>> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
>> +#
>> +# To support several mount points you can use a different variable flag. Assume we
>> +# what to have a writable location on the file system, but not interested where the data
>> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
>> +#
>> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
>> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
>> +
>> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
>> +
>> +inherit systemd
>> +
>> +def strForBash(s):
>> +    return s.replace('\\', '\\\\')
>> +
>> +def unitFileList(d):
>> +    fileList = []
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            fileList.append(mountUnitName(path))
>> +            fileList.append(helperUnitName(path))
>> +
>> +    return fileList
>> +
>> +# this function is based onhttps://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
>> +def escapeSystemdUnitName(path):
>> +    escapeMap = {
>> +        '/': '-',
>> +        '-': "\\x2d",
>> +        '\\': "\\x5d"
>> +    }
>> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
>> +
>> +def mountUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '.mount'
>> +
>> +def helperUnitName(unit):
>> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
>> +
>> +python do_create_overlayfs_units() {
>> +    CreateDirsUnitTemplate = """[Unit]
>> +Description=Overlayfs directories setup
>> +Requires={DATA_MOUNT_UNIT}
>> +After={DATA_MOUNT_UNIT}
>> +DefaultDependencies=no
>> +
>> +[Service]
>> +Type=oneshot
>> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
>> +RemainAfterExit=true
>> +StandardOutput=journal
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +"""
>> +    MountUnitTemplate = """[Unit]
>> +Description=Overlayfs mount unit
>> +Requires={CREATE_DIRS_SERVICE}
>> +After={CREATE_DIRS_SERVICE}
>> +
>> +[Mount]
>> +What=overlay
>> +Where={LOWERDIR}
>> +Type=overlay
>> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> +"""
>> +
>> +    def prepareUnits(data, lower):
>> +        args = {
>> +            'DATA_MOUNT_POINT': data,
>> +            'DATA_MOUNT_UNIT': mountUnitName(data),
>> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
>> +            'LOWERDIR': lower,
>> +        }
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
>> +            f.write(MountUnitTemplate.format(**args))
>> +
>> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
>> +            f.write(CreateDirsUnitTemplate.format(**args))
>> +
>> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
>> +    for mountPoint in overlayMountPoints:
>> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
>> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
>> +}
>> +
>> +# we need to generate file names early during parsing stage
>> +python () {
>> +    unitList = unitFileList(d)
>> +    for unit in unitList:
>> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
>> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
>> +
>> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
>> +}
>> +
>> +do_install_append() {
>> +    install -d ${D}${systemd_system_unitdir}
>> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
>> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
>> +    done
>> +}
>> +
>> +addtask create_overlayfs_units before do_install
>>
> Mit freundlichen Grüßen / Kind regards
>
> -- 
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Straße 2/1
> D-71634 Ludwigsburg
>
> Mobile   : +4917662901545
> Email    :ayoub.zaki@embexus.com
> Homepage :https://embexus.com
> VAT No.  : DE313902634
>
> 
>


--------------4210AFEDC65A95618E8B052A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Ayoub,<br>
      Thanks for the hint. I knew the recipe exists, but I didn't know
      it uses overlay.<br>
      <br>
      I did have a closer look at the mount-copybind script, and it uses
      overlay indeed, but it seems it's used for the other purpose.
      Originally the recipe provided only bind-mount functionality, they
      added overlayfs support later to save on space.<br>
      <br>
      I tried to use the recipe with my use case, but it turns out that
      reverses the options of mount command in mount-copybind. I'm also
      not sure how the dependencies should be injected into the mount
      unit.<br>
      <br>
      Vyacheslav<br>
      <br>
      On 04.06.2021 22:20, Ayoub Zaki wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e82221f4-deeb-3cb2-037c-d5672a19a006@embexus.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><tt>Hi,</tt><tt><br>
        </tt></p>
      <p><br>
      </p>
      <tt>volatile-binds (maybe the *volatile* naming is misleading)
        recipe in yocto is already doing that, </tt><tt>just to be
        appended .ie:</tt><tt><br>
      </tt><tt><br>
      </tt>
      <pre class="code highlight" lang="plaintext"><span id="LC1" class="line" lang="plaintext">VOLATILE_BINDS += "\</span>
<span id="LC2" class="line" lang="plaintext">    /data/lib/systemd/network /lib/systemd/network\n\</span>
<span id="LC3" class="line" lang="plaintext">    /data/home/root /home/root\n\</span>
<span id="LC4" class="line" lang="plaintext">"</span>

It will generate for each overlay a mount point service.

BR
</pre>
      <br>
      <div class="moz-cite-prefix">On 6/3/21 4:21 PM, Vyacheslav Yurkov
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20210603142106.115932-1-uvv.mail@gmail.com">
        <pre class="moz-quote-pre" wrap="">It's often desired in Embedded System design to have a read-only rootfs.
But a lot of different applications might want to have a read-write access
to some parts of a filesystem. It can be especially useful when your update
mechanism overwrites the whole rootfs, but you want your application data
to be preserved between updates. This class provides a way to achieve that
by means of overlayfs and at the same time keeping the base rootfs read-only.

Signed-off-by: Vyacheslav Yurkov <a class="moz-txt-link-rfc2396E" href="mailto:uvv.mail@gmail.com" moz-do-not-send="true">&lt;uvv.mail@gmail.com&gt;</a>
---
 meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 meta/classes/overlayfs.bbclass

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
new file mode 100644
index 0000000000..7fac3e696e
--- /dev/null
+++ b/meta/classes/overlayfs.bbclass
@@ -0,0 +1,132 @@
+# Class for generation of overlayfs mount units
+#
+# It's often desired in Embedded System design to have a read-only rootfs.
+# But a lot of different applications might want to have a read-write access to
+# some parts of a filesystem. It can be especially useful when your update mechanism
+# overwrites the whole rootfs, but you want your application data to be preserved
+# between updates. This class provides a way to achieve that by means
+# of overlayfs and at the same time keeping the base rootfs read-only.
+#
+# Usage example.
+#
+# Set a mount point for a partition overlayfs is going to use as upper layer
+# in your machine configuration. Underlying file system can be anything that
+# is supported by overlayfs
+#
+#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
+#
+# The class assumes you have a data.mount systemd unit defined elsewhere in your
+# BSP and installed to the image.
+#
+# Then you can specify writable directories on a recipe base
+#
+#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
+#
+# To support several mount points you can use a different variable flag. Assume we
+# what to have a writable location on the file system, but not interested where the data
+# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
+#
+#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
+#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
+
+OVERLAYFS_WRITABLE_PATHS[data] ?= ""
+
+inherit systemd
+
+def strForBash(s):
+    return s.replace('\\', '\\\\')
+
+def unitFileList(d):
+    fileList = []
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    for mountPoint in overlayMountPoints:
+        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            fileList.append(mountUnitName(path))
+            fileList.append(helperUnitName(path))
+
+    return fileList
+
+# this function is based on <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c" moz-do-not-send="true">https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c</a>
+def escapeSystemdUnitName(path):
+    escapeMap = {
+        '/': '-',
+        '-': "\\x2d",
+        '\\': "\\x5d"
+    }
+    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
+
+def mountUnitName(unit):
+    return escapeSystemdUnitName(unit) + '.mount'
+
+def helperUnitName(unit):
+    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
+
+python do_create_overlayfs_units() {
+    CreateDirsUnitTemplate = """[Unit]
+Description=Overlayfs directories setup
+Requires={DATA_MOUNT_UNIT}
+After={DATA_MOUNT_UNIT}
+DefaultDependencies=no
+
+[Service]
+Type=oneshot
+ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} &amp;&amp; mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
+RemainAfterExit=true
+StandardOutput=journal
+
+[Install]
+WantedBy=multi-user.target
+"""
+    MountUnitTemplate = """[Unit]
+Description=Overlayfs mount unit
+Requires={CREATE_DIRS_SERVICE}
+After={CREATE_DIRS_SERVICE}
+
+[Mount]
+What=overlay
+Where={LOWERDIR}
+Type=overlay
+Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
+
+[Install]
+WantedBy=multi-user.target
+"""
+
+    def prepareUnits(data, lower):
+        args = {
+            'DATA_MOUNT_POINT': data,
+            'DATA_MOUNT_UNIT': mountUnitName(data),
+            'CREATE_DIRS_SERVICE': helperUnitName(lower),
+            'LOWERDIR': lower,
+        }
+
+        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
+            f.write(MountUnitTemplate.format(**args))
+
+        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
+            f.write(CreateDirsUnitTemplate.format(**args))
+
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    for mountPoint in overlayMountPoints:
+        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
+}
+
+# we need to generate file names early during parsing stage
+python () {
+    unitList = unitFileList(d)
+    for unit in unitList:
+        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
+        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
+
+    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
+}
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    for unit in ${OVERLAYFS_UNIT_LIST}; do
+        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
+    done
+}
+
+addtask create_overlayfs_units before do_install
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com" moz-do-not-send="true">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com" moz-do-not-send="true">https://embexus.com</a>
VAT No.  : DE313902634</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4210AFEDC65A95618E8B052A--
