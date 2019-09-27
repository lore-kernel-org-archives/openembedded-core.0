Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 385517F2F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:03:48 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n197so18542598iod.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mJdGKN1lKzpwWOQcR7E6WtZNWb2LVnvGk0xyyXOSKNk=;
	b=qmL3TiCOjZu/fjzz10zVVQ86i2PWp1dgL0HTaOnKEXBgTld6WFWiVccrNDWNWisoVR
	tlypJnVztiaT8HWeiF+zqrL4uH25hIwIMDO1CZ/OB7c7Ze46xL+aVcOEFlGHmLDVVHaD
	0i/scsiQWzwNcOnzJ1Gtq7RkSkkAmlyL0K4WLBCMtfMGbwltBbOWXT6gDIFFSL9jYVVs
	gv9txYzsTvTFbUKmOlpsj8OXRmtohCKx+I4ZBvMm0ynmRifHbpp6Ixbdweu1Wr/dHE5q
	kz++iHCyRUyx7kJtTbYIz51ugpjr7wvbFdYbfPJKDETjq5iBl7z+hGXYnVb/azNfAoi2
	sJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mJdGKN1lKzpwWOQcR7E6WtZNWb2LVnvGk0xyyXOSKNk=;
	b=OUS8XFf5QQWzxKstjbMCuOUHVM1yta3n9Gy+SSmshqxJ7np5VCYD8dvZ/B0TWjgv6n
	zP/Y5Cg2G0tWTGN4hDOaofRjpW7u4K7FIHzEKduP28uMcV3IFSusIZmkk6iGDZBLLwSP
	BWBLP+vsaonoAFxYR2BT4hyAJcF14oZTGE+SIo96G/U6chCYutJBvWjoFbOtSKzElQcQ
	0PexKpe9+n5oKBu34bInY4go7EwEPI1XbBUB9BRA5rWvpePC3EmSHhh1ygj+n8yTooL4
	sbq7kWbPcF2+YwokJhAnSKrbmyY1R7JfLqqK9a3SxtQBBgTToiu3XrY0lFZARYFnjzoA
	sF6Q==
X-Gm-Message-State: APjAAAW8pGd5CpOecIVEIccPnRn+P26uhNxjxYwRIemK/u6w6/i4hwrc
	wdrv/PkvL+WcuZ9Eu46PZmyJNzScrFUjzFQeJzg=
X-Google-Smtp-Source: APXvYqw7AJZJoFdU8BS90bXND8DLdM3Kuq1MEC4T0+D7zAOvo96XZLXaAns68suX+k2Sterdy7M3Gq+wWad9iNrMRyg=
X-Received: by 2002:a92:5f09:: with SMTP id t9mr5992170ilb.217.1569607428980; 
	Fri, 27 Sep 2019 11:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190916182114.17200-1-JPEWhacker@gmail.com>
	<20190926175751.12195-1-JPEWhacker@gmail.com>
In-Reply-To: <20190926175751.12195-1-JPEWhacker@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 27 Sep 2019 19:03:36 +0100
Message-ID: <CAO5Uq5TPxmXq0NWQixMLKmH9goUCXm8Ov=BaB8S_9Pmy8DPCYg@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/reproducible_build: Move SDE deploy to another directory
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
X-List-Received-Date: Fri, 27 Sep 2019 18:03:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 26, 2019 at 6:58 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The deployment of the source date epoch file had a race condition where
> any task attempting to read from the file would race with creation of
> the sstate archive for the do_deploy_source_date_epoch task. The
> creation of the sstate archive requires moving the directory to a
> temporary location, then moving it back. This means that the file
> disappears for a short period of time, which will cause a failure if any
> other task is running and trying to open the file to get the current
> source date epoch.
>
> The solution is to copy the source date epoch file to a separate
> directory when deploying so the file never disappears. When the file is
> restored from sstate, it is moved to the correct location after being
> extracted.
>
> [YOCTO #13501]
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/reproducible_build.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 8788ad7145c..99b749a9ee2 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -39,19 +39,27 @@ inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'repr
>
>  SDE_DIR ="${WORKDIR}/source-date-epoch"
>  SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
> +SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
>
>  SSTATETASKS += "do_deploy_source_date_epoch"
>
>  do_deploy_source_date_epoch () {
>      echo "Deploying SDE to ${SDE_DIR}."
> +    mkdir -p ${SDE_DEPLOYDIR}
> +    if [ -e ${SDE_FILE} ]; then
> +        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
> +    fi
>  }
>
>  python do_deploy_source_date_epoch_setscene () {
>      sstate_setscene(d)
> +    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
> +    if os.path.exists(sde_file):
> +        os.rename(sde_file, d.getVar('SDE_FILE'))
>  }
>
> -do_deploy_source_date_epoch[dirs] = "${SDE_DIR}"
> -do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
> +do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
> +do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
>  addtask do_deploy_source_date_epoch_setscene
>  addtask do_deploy_source_date_epoch before do_configure after do_patch
>

This seems to have broken builds with reproducible builds enabled and
sstate downloaded from a mirror - I just get a blizzard of:

ERROR: Logfile of failure stored in:
/home/akiernan/nanohub/build/tmp/work/x86_64-linux/automake-native/1.16.1-r0/temp/log.do_deploy_source_date_epoch_setscene.113823
WARNING: Setscene task
(virtual:native:/home/akiernan/nanohub/build/../poky/meta/recipes-devtools/automake/automake_1.16.1.bb:do_deploy_source_date_epoch_setscene)
failed with exit code '1' - real task will be run instead
ERROR: autoconf-native-2.69-r11 do_deploy_source_date_epoch_setscene:
Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_deploy_source_date_epoch_setscene(d)
     0003:
File: '/home/akiernan/nanohub/build/../poky/meta/classes/reproducible_build.bbclass',
lineno: 58, function: do_deploy_source_date_epoch_setscene
     0054:python do_deploy_source_date_epoch_setscene () {
     0055:    sstate_setscene(d)
     0056:    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'),
'__source_date_epoch.txt')
     0057:    if os.path.exists(sde_file):
 *** 0058:        os.rename(sde_file, d.getVar('SDE_FILE'))
     0059:}
     0060:
     0061:do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
     0062:do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/deploy-source-date-epoch/__source_date_epoch.txt'
-> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/source-date-epoch/__source_date_epoch.txt'

ERROR: Logfile of failure stored in:
/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/temp/log.do_deploy_source_date_epoch_setscene.113869
WARNING: Setscene task
(virtual:native:/home/akiernan/nanohub/build/../poky/meta/recipes-devtools/autoconf/autoconf_2.69.bb:do_deploy_source_date_epoch_setscene)
failed with exit code '1' - real task will be run instead
ERROR: m4-native-1.4.18-r0 do_deploy_source_date_epoch_setscene: Error
executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_deploy_source_date_epoch_setscene(d)
     0003:
File: '/home/akiernan/nanohub/build/../poky/meta/classes/reproducible_build.bbclass',
lineno: 58, function: do_deploy_source_date_epoch_setscene
     0054:python do_deploy_source_date_epoch_setscene () {
     0055:    sstate_setscene(d)
     0056:    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'),
'__source_date_epoch.txt')
     0057:    if os.path.exists(sde_file):
 *** 0058:        os.rename(sde_file, d.getVar('SDE_FILE'))
     0059:}
     0060:
     0061:do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
     0062:do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/deploy-source-date-epoch/__source_date_epoch.txt'
-> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/source-date-epoch/__source_date_epoch.txt'

ERROR: Logfile of failure stored in:
/home/akiernan/nanohub/build/tmp/work/x86_64-linux/m4-native/1.4.18-r0/temp/log.do_deploy_source_date_epoch_setscene.113897


-- 
Alex Kiernan

