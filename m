Received: from mailrelay4-3.pub.mailoutpod1-cph3.one.com (mailrelay4-3.pub.mailoutpod1-cph3.one.com [46.30.212.13])
 by mx.groups.io with SMTP id smtpd.web10.4527.1622838035261744066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 13:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=KYzw9jBF;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.13, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:to:
	 subject:from;
	bh=sHST37aRCQMmjknXQcePxHlApL0l7CHjQ0yHMHtoPns=;
	b=KYzw9jBFogDeSxpkxlGgRBCInd76uJPCdRAcO2m54+MdmQmm61MYsu5vJCpC8BZtg5aXoauRmicxt
	 zg0sXVivNVw9wBxUBjJKNc4kvHxFu8yPCv7MGjUWREYIymY6LLhebLKfjBTJ7goXj+ydTUcVrQfSCy
	 ztyWpm+IZ1kgJuAk+Xnoinao9w1SJOfP+Yw0AYZmb2IuRGGhQ1Z5rCjXLFgXdr3L81w/447m30ERxH
	 gKY5AQ1jH4erNIshrs21MkcB6udqQC+QU/h7jXlCFTKJxeJruDDgnlzcH6xVccbMK/VLoffrk561AP
	 fPXzbTMISXDQEWl5EkxUoFjSgLE+9Yg==
X-HalOne-Cookie: 5345256670ce07606dd06459855a314700010d86
X-HalOne-ID: 4f47b074-c572-11eb-a907-d0431ea8bb10
Received: from [192.168.178.41] (x4dbd09fa.dyn.telefonica.de [77.189.9.250])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 4f47b074-c572-11eb-a907-d0431ea8bb10;
	Fri, 04 Jun 2021 20:20:31 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: openembedded-core@lists.openembedded.org
References: <20210603142106.115932-1-uvv.mail@gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
Message-ID: <e82221f4-deeb-3cb2-037c-d5672a19a006@embexus.com>
Date: Fri, 4 Jun 2021 22:20:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210603142106.115932-1-uvv.mail@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------34254CA2665C1FA63BF0DAA5"
Content-Language: en-US

--------------34254CA2665C1FA63BF0DAA5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


volatile-binds (maybe the *volatile* naming is misleading) recipe in 
yocto is already doing that, just to be appended .ie:

VOLATILE_BINDS += "\
/data/lib/systemd/network /lib/systemd/network\n\
/data/home/root /home/root\n\
"

It will generate for each overlay a mount point service.

BR


On 6/3/21 4:21 PM, Vyacheslav Yurkov wrote:
> It's often desired in Embedded System design to have a read-only rootfs.
> But a lot of different applications might want to have a read-write access
> to some parts of a filesystem. It can be especially useful when your update
> mechanism overwrites the whole rootfs, but you want your application data
> to be preserved between updates. This class provides a way to achieve that
> by means of overlayfs and at the same time keeping the base rootfs read-only.
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>   meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
>   1 file changed, 132 insertions(+)
>   create mode 100644 meta/classes/overlayfs.bbclass
>
> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> new file mode 100644
> index 0000000000..7fac3e696e
> --- /dev/null
> +++ b/meta/classes/overlayfs.bbclass
> @@ -0,0 +1,132 @@
> +# Class for generation of overlayfs mount units
> +#
> +# It's often desired in Embedded System design to have a read-only rootfs.
> +# But a lot of different applications might want to have a read-write access to
> +# some parts of a filesystem. It can be especially useful when your update mechanism
> +# overwrites the whole rootfs, but you want your application data to be preserved
> +# between updates. This class provides a way to achieve that by means
> +# of overlayfs and at the same time keeping the base rootfs read-only.
> +#
> +# Usage example.
> +#
> +# Set a mount point for a partition overlayfs is going to use as upper layer
> +# in your machine configuration. Underlying file system can be anything that
> +# is supported by overlayfs
> +#
> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> +#
> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
> +# BSP and installed to the image.
> +#
> +# Then you can specify writable directories on a recipe base
> +#
> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +#
> +# To support several mount points you can use a different variable flag. Assume we
> +# what to have a writable location on the file system, but not interested where the data
> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
> +#
> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +
> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
> +
> +inherit systemd
> +
> +def strForBash(s):
> +    return s.replace('\\', '\\\\')
> +
> +def unitFileList(d):
> +    fileList = []
> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> +    for mountPoint in overlayMountPoints:
> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +            fileList.append(mountUnitName(path))
> +            fileList.append(helperUnitName(path))
> +
> +    return fileList
> +
> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
> +def escapeSystemdUnitName(path):
> +    escapeMap = {
> +        '/': '-',
> +        '-': "\\x2d",
> +        '\\': "\\x5d"
> +    }
> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
> +
> +def mountUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '.mount'
> +
> +def helperUnitName(unit):
> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
> +
> +python do_create_overlayfs_units() {
> +    CreateDirsUnitTemplate = """[Unit]
> +Description=Overlayfs directories setup
> +Requires={DATA_MOUNT_UNIT}
> +After={DATA_MOUNT_UNIT}
> +DefaultDependencies=no
> +
> +[Service]
> +Type=oneshot
> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
> +RemainAfterExit=true
> +StandardOutput=journal
> +
> +[Install]
> +WantedBy=multi-user.target
> +"""
> +    MountUnitTemplate = """[Unit]
> +Description=Overlayfs mount unit
> +Requires={CREATE_DIRS_SERVICE}
> +After={CREATE_DIRS_SERVICE}
> +
> +[Mount]
> +What=overlay
> +Where={LOWERDIR}
> +Type=overlay
> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
> +
> +[Install]
> +WantedBy=multi-user.target
> +"""
> +
> +    def prepareUnits(data, lower):
> +        args = {
> +            'DATA_MOUNT_POINT': data,
> +            'DATA_MOUNT_UNIT': mountUnitName(data),
> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
> +            'LOWERDIR': lower,
> +        }
> +
> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
> +            f.write(MountUnitTemplate.format(**args))
> +
> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
> +            f.write(CreateDirsUnitTemplate.format(**args))
> +
> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> +    for mountPoint in overlayMountPoints:
> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
> +}
> +
> +# we need to generate file names early during parsing stage
> +python () {
> +    unitList = unitFileList(d)
> +    for unit in unitList:
> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
> +
> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
> +}
> +
> +do_install_append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
> +    done
> +}
> +
> +addtask create_overlayfs_units before do_install
>
> 
>
Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


--------------34254CA2665C1FA63BF0DAA5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
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

Signed-off-by: Vyacheslav Yurkov <a class="moz-txt-link-rfc2396E" href="mailto:uvv.mail@gmail.com">&lt;uvv.mail@gmail.com&gt;</a>
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
+# this function is based on <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c">https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c</a>
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
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------34254CA2665C1FA63BF0DAA5--
