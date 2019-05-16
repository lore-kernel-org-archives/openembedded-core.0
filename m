Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0FB6C466
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 10:54:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id h11so2962980wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=noBEK7XOtj2eX9fr1SpCAlWSlL91mCUjmB0eOzCcV+0=;
	b=DHMJ6p6SlYy9dPjoV7hxAE3LB1/a4Z3VwWX9k8ZSI60RlMrT5j9w5vwZR/qdMnGuQY
	ea/YKdr9CqAOv/2+fO87s9YrHhQAUyMSxpUB+IFCnmOLq7MxzNSlwMLyIBEIhpyuVrJ2
	WPF1GU3D6Xsu2qaJLvZUuHbcJZhmZgn4DVFNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=noBEK7XOtj2eX9fr1SpCAlWSlL91mCUjmB0eOzCcV+0=;
	b=WQsKkD0RdCNSi7xX5LKc21ApCkx5IZj/S/2l2pkpGzuAey3OelRdNq36iLkpoKTK0V
	UIFvfR6rKeRdL3WMcq/OOr1qnOxkT8U+1f0daM8BVWBoR/6nIfaYXGcvvxi5ul+1lXo4
	qpHPzoCLGhE1UmW0bZB70R2dfrwxiM5jncV2xy7rRCRzMcQxPZAwEhKaaxIzq2G3NYpk
	Sp7gxL7Fw1SnoE/2a61hlQq5Hpn4d7vsTVbV5uNWr5zHc54VJzpDSPQl3aDa+OVAIg0e
	MN33wyrQ+Jls3iHKPrLglakaaCYp7t+qRfPKbAcimnNCYIdV1LgjQasUHqoo+8zEJ5/p
	a5Hg==
X-Gm-Message-State: APjAAAUougfthf049sh4woJOfXvSfjlav7eK9KnTmE9rHdtw5//+gVvY
	UzFRhKv9b9qVRY2TsLCrSjLWSqdHdXw=
X-Google-Smtp-Source: APXvYqzi79lWHQBLfyyUmRi1UrGCZdrAdCgw1LirZ923LKtlR3FtGUOo/yXVVDgJrJSu7quIvmPRuQ==
X-Received: by 2002:a1c:f916:: with SMTP id x22mr2358412wmh.81.1558004053623; 
	Thu, 16 May 2019 03:54:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d72sm4582849wmd.12.2019.05.16.03.54.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 03:54:12 -0700 (PDT)
Message-ID: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 16 May 2019 11:54:09 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Thu, 16 May 2019 10:54:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a need to check the dependencies of our ptest packages. The
best way to do that is to take a minimal image and run them under that
in isolation. That would be a bit tedious and boring.

It got me thinking about creative ways to do that and I thought I'd
share the result.

I created an image recipe:

$ cat p-t-image.bb 
require recipes-core/images/core-image-minimal.bb

require conf/distro/include/ptest-packagelists.inc

PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
ALL_PTESTS = "${@' '.join(['p-t-image-'+x for x in d.getVar('PTESTS').split()])}"

IMAGE_INSTALL_append = " ${MCNAME} openssh"

BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('PTESTS').split()])}"

IMAGE_OVERHEAD_FACTOR = "1.0"
IMAGE_ROOTFS_EXTRA_SPACE = "1324288"

# ptests need more memory than standard to avoid the OOM killer
QB_MEM = "-m 1024"


Its not fast to parse this creates about 59 variants of the image. Its
(ab)using the mcextend class to an image and add the ptest to that
image for each ptest in the PTESTS_SLOW and PTESTS_FAST variables. It
also adds openssh since we need an ssh client in the images for
testimage to work. I also had to add extra space and memory to the
image config so all the tests could work.

You can get a list of the target images with:

bitbake p-t-image-elfutils-ptest -e | grep ALL_PTESTS=

then run:

bitbake <targets>

and then

bitbake <targets> -c testimage

which batch build and then runs all the images in parallel.

The results also get aggregated automatically into the json file so if
you delete it before starting, the json file is equavalient from a
ptest perspective to if they'd all been run in the same image.

The results I got from this are:

--------------------------------------------------------------------------------------------------------------
Recipe                       | Passed      | Failed    | Skipped   | Time(s)   
--------------------------------------------------------------------------------------------------------------
acl                          | 1           | 1         | 0         | 0
apr                          | 0           | 0         | 0         | -
apr-util                     | 4           | 0         | 0         | -
attr                         | 0           | 0         | 0         | 0
bash                         | 36          | 8         | 0         | 107 T
bluez5                       | 23          | 2         | 0         | 5
busybox                      | 528         | 4         | 76        | 4
bzip2                        | 0           | 0         | 0         | 1
dbus-test                    | 0           | 0         | 0         | 91 T
diffstat                     | 439         | 0         | 0         | 4
diffutils                    | 19          | 0         | 2         | 2
e2fsprogs                    | 0           | 0         | 0         | 78
elfutils                     | 172         | 24        | 7         | 21
ethtool                      | 2           | 0         | 0         | 0
flex                         | 0           | 0         | 0         | 1
gawk                         | 342         | 0         | 0         | 2
gdbm                         | 24          | 0         | 0         | 1
gdk-pixbuf                   | 20          | 0         | 0         | 39
gettext                      | 0           | 0         | 0         | 1
glib-2.0                     | 242         | 3         | 0         | 344
gstreamer1.0                 | 103         | 1         | 0         | 105
gzip                         | 0           | 0         | 0         | 1
json-glib                    | 14          | 0         | 0         | 1
kbd                          | 5           | 2         | 0         | 0
libconvert-asn1-perl         | 0           | 22        | 0         | 0
liberror-perl                | 0           | 15        | 0         | 1
libevent                     | 1           | 0         | 0         | 86
libpcre                      | 0           | 0         | 0         | 0
libtest-needs-perl           | 0           | 2         | 0         | 0
libtimedate-perl             | 3           | 2         | 0         | 0
liburi-perl                  | 0           | 39        | 2         | 0
libusb1                      | 4           | 0         | 0         | 6
libxml-namespacesupport-perl | 0           | 1         | 0         | 0
libxml-parser-perl           | 0           | 15        | 0         | 0
libxml-perl                  | 0           | 6         | 0         | 0
libxml-sax-base-perl         | 0           | 19        | 0         | 1
libxml-sax-perl              | 0           | 14        | 0         | 0
libxml-simple-perl           | 0           | 14        | 0         | 0
libxml2                      | 134         | 0         | 0         | 16
lttng-tools                  | 3397        | 626       | 1         | 348 T
lzo                          | 5           | 0         | 0         | 2
m4                           | 0           | 0         | 0         | 1
nettle                       | 97          | 0         | 2         | 10
openssh                      | 0           | 0         | 1         | 1
openssl                      | 146         | 1         | 8         | 78
opkg                         | 0           | 0         | 0         | 11
pango                        | 12          | 0         | 0         | 1
parted                       | 0           | 0         | 0         | 0
perl                         | 2423        | 19        | 238       | 703
python                       | 302         | 5         | 41        | 330
python3                      | 30277       | 2         | 1043      | 1005
quilt                        | 0           | 57        | 0         | 1
sed                          | 86          | 0         | 0         | 4
slang                        | 0           | 0         | 0         | 1
strace                       | 466         | 18        | 147       | 179
tcl                          | 149         | 0         | 0         | 183
util-linux                   | 336         | 2         | 80        | 40
valgrind                     | 149         | 1         | 9         | 537
zlib                         | 1           | 0         | 0         | 1

which can be compared against:

https://autobuilder.yocto.io/pub/non-release/20190514-14/testresults/testresult-report.txt

which means we have a fair number of ptest recipes with dependency problems:

--------------------------------------------------------------------------------------------------------------
Recipe                       | Passed      | Failed    | Skipped   | Time(s)   
--------------------------------------------------------------------------------------------------------------
acl                          | 1           | 1         | 0         | 0
apr                          | 0           | 0         | 0         | -
apr-util                     | 4           | 0         | 0         | -
attr                         | 0           | 0         | 0         | 0
bash                         | 36          | 8         | 0         | 107 T
bluez5                       | 23          | 2         | 0         | 5
bzip2                        | 0           | 0         | 0         | 1
dbus-test                    | 0           | 0         | 0         | 91 T
diffutils                    | 19          | 0         | 2         | 2
e2fsprogs                    | 0           | 0         | 0         | 78
elfutils                     | 172         | 24        | 7         | 21
ethtool                      | 2           | 0         | 0         | 0
flex                         | 0           | 0         | 0         | 1
gettext                      | 0           | 0         | 0         | 1
glib-2.0                     | 242         | 3         | 0         | 344
gzip                         | 0           | 0         | 0         | 1
kbd                          | 5           | 2         | 0         | 0
libconvert-asn1-perl         | 0           | 22        | 0         | 0
liberror-perl                | 0           | 15        | 0         | 1
libpcre                      | 0           | 0         | 0         | 0
libtest-needs-perl           | 0           | 2         | 0         | 0
libtimedate-perl             | 3           | 2         | 0         | 0
liburi-perl                  | 0           | 39        | 2         | 0
libxml-namespacesupport-perl | 0           | 1         | 0         | 0
libxml-parser-perl           | 0           | 15        | 0         | 0
libxml-perl                  | 0           | 6         | 0         | 0
libxml-sax-base-perl         | 0           | 19        | 0         | 1
libxml-sax-perl              | 0           | 14        | 0         | 0
libxml-simple-perl           | 0           | 14        | 0         | 0
lttng-tools                  | 3397        | 626       | 1         | 348 T
m4                           | 0           | 0         | 0         | 1
openssh                      | 0           | 0         | 1         | 1
opkg                         | 0           | 0         | 0         | 11
parted                       | 0           | 0         | 0         | 0
python                       | 302         | 5         | 41        | 330
python3                      | 30277       | 2         | 1043      | 1005
quilt                        | 0           | 57        | 0         | 1
slang                        | 0           | 0         | 0         | 1
util-linux                   | 336         | 2         | 80        | 40

The logs from this are available here:

https://www.rpsys.net/wp/rp/testresults.json.gz

(can be extracted with resulttool log)


Anyhow, I thought I'd share this slightly crazy but IMO fairly neat
trick :)

Cheers,

Richard


