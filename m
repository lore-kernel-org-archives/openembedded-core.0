Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QE7Uj-0000cM-94 for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 00:09:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM70PJ001420;
	Sun, 24 Apr 2011 23:07:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01370-01; Sun, 24 Apr 2011 23:06:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM6kov001375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 24 Apr 2011 23:06:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <49c9863d3b97318fb053848cb5d2981c94f07487.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<49c9863d3b97318fb053848cb5d2981c94f07487.1303539961.git.sgw@linux.intel.com>
Date: Sun, 24 Apr 2011 22:28:56 +0100
Message-ID: <1303680536.5518.368.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 37/37] create-lsb-image:Rename creat-lsb-image and fix some bugs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Apr 2011 22:09:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-22 at 23:29 -0700, Saul Wold wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Rename creat-lsb-image to create-lsb-image
> Fix some fuctions for more practical

Please in future make renames separate to commits so people can more
easily see what changed.

Cheers,

Richard


>  scripts/creat-lsb-image  |  198 ----------------------------------------
>  scripts/create-lsb-image |  228 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 228 insertions(+), 198 deletions(-)
>  delete mode 100755 scripts/creat-lsb-image
>  create mode 100755 scripts/create-lsb-image
> 
> diff --git a/scripts/creat-lsb-image b/scripts/creat-lsb-image
> deleted file mode 100755
> index 657784c..0000000
> --- a/scripts/creat-lsb-image
> +++ /dev/null
> @@ -1,198 +0,0 @@
> -#!/bin/bash
> -#
> -# Copyright (c) 2005-2010 Wind River Systems, Inc.
> -#
> -# This program is free software; you can redistribute it and/or modify
> -# it under the terms of the GNU General Public License version 2 as
> -# published by the Free Software Foundation.
> -#
> -# This program is distributed in the hope that it will be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> -# See the GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write to the Free Software
> -# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> -
> -
> -red='\E[31;40m'
> -green='\E[32;40m'
> -USER=`whoami`
> -ARCH=$1
> -MACHINE_ARCH=` bitbake -e | grep ^MACHINE_ARCH | cut -d '=' -f2 | cut -d '"' -f2`
> -IMAGE_PATH=` bitbake -e | grep ^COREBASE | cut -d '=' -f2 | cut -d '"' -f2`/build/tmp/deploy/images/
> -
> -
> -ECHO()
> -{
> -    echo -e "${green}$@"
> -    tput sgr0
> -}
> -
> -exit_check()
> -{
> -    if [ ! $? -eq 0 ]; then
> -        exit $?
> -    fi
> -}
> -
> -usage()
> -{
> -    ECHO "${red}usage:you should input one of the next commmands according to detailed target platform:"
> -    ECHO "creat-lsb-image x86"
> -    ECHO "creat-lsb-image x86_64"
> -    ECHO "creat-lsb-image ppc32"
> -}
> -
> -#There should be a patameter to get machine type
> -if [ $# -ne 1 ]; then
> -    usage
> -    exit 1
> -fi
> -
> -#check lsb image
> -if [ ! -d $IMAGE_PATH ];then
> -    ECHO "${red}There isn't image directory"
> -    exit 1
> -fi
> -ECHO "Enter directory $IMAGE_PATH"
> -cd $IMAGE_PATH
> -
> -#get architecture
> -PN=`find . -name core-image-lsb-${MACHINE_ARCH}\*.rootfs.tar.bz2 -type f | awk -F- 'BEGIN{ max=0;} {if( NR!=0 && $5>max ) max=$5 }END{ printf "%d" ,max ;}'`
> -if [ "XPN" == "X" ];then
> -   ECHO "${red}Don't find lsb image on platform, Please run \"core-image-lsb\" to generate lsb image"
> -   exit 1
> -fi
> -
> -if [ $PN -eq 0 ];then
> -	ECHO "${red}Can't ${MACHINE_ARCH} rootfs.tar.gz,Please run core-image-lsb to get lsb image"
> -	exit 1
> -fi
> -#set varible ARCH
> -if [ ${ARCH} == x86 ];then
> -	T_ARCH=ia32
> -    P_ARCH=i486
> -elif [ ${ARCH} == x86_64 ];then
> -	T_ARCH=ia64
> -    P_ARCH=ia64
> -else
> -	P_ARCH=ppc
> -	T_ARCH=${ARCH}
> -fi
> -
> -#umount lsbtmp 
> -if [ -d lsbtmp ];then
> -	sudo umount lsbtmp
> -fi
> - 
> -#download lsb test suite
> -mkdir -p lsb-test-suite-${MACHINE_ARCH} 
> -if [ -d lsb-test-suite-${MACHINE_ARCH} ];then
> -	cd lsb-test-suite-${MACHINE_ARCH}
> -	ECHO "Download lsb test suite, it could take some time..."
> -    wget -c -t 5  http://ftp.linuxfoundation.org/pub/lsb/bundles/released-4.1.0/dist-testkit/lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz
> -    exit_check
> -	ECHO "Download lsb-xdg-utils-4.0.0-2.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/lsbdev/released-4.1.0/binary/${T_ARCH}/lsb-xdg-utils-4.0.0-2.${P_ARCH}.rpm
> -    exit_check
> -	ECHO "Downlocad lsb-apache-2.2.8-2.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-apache-2.2.14-3.lsb4.${P_ARCH}.rpm
> -    exit_check
> -	ECHO "Downlocad lsb-tcl-8.5.1-2.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-tcl-8.5.7-6.lsb4.${P_ARCH}.rpm
> -    exit_check
> -	ECHO "Downlocad lsb-expect-5.43.0-7.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-expect-5.43.0-11.lsb4.${P_ARCH}.rpm 
> -    exit_check
> -	ECHO "Downlocad lsb-groff-1.19.2-4.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-groff-1.20.1-5.lsb4.${P_ARCH}.rpm  
> -    exit_check
> -	ECHO "Downlocad lsb-raptor-1.4.16-2.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-raptor-1.4.19-3.lsb4.${P_ARCH}.rpm 
> -    exit_check
> -	ECHO "Downlocad lsb-xpdf-1.01-7.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-xpdf-1.01-10.lsb4.${P_ARCH}.rpm
> -    exit_check
> -	ECHO "Downlocad lsb-samba-3.0.28a-3.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-samba-3.4.3-5.lsb4.${P_ARCH}.rpm 
> -    exit_check
> -	ECHO "Downlocad lsb-rsync-3.0.0-2.lsb4.${P_ARCH}.rpm"
> -	wget -c -t 5 http://ftp.linux-foundation.org/pub/lsb/app-battery/released-4.1.0/${T_ARCH}/lsb-rsync-3.0.6-3.lsb4.${P_ARCH}.rpm
> -    exit_check
> -else
> -	ECHO "Can't find lsb test suite for ${MACHINE_ARCH}"
> -fi
> -cd ..
> -if [ -L core-image-lsb-${MACHINE_ARCH}.ext3 ];then
> -    /bin/rm core-image-lsb-${MACHINE_ARCH}.ext3
> -    exit_check
> -fi
> -
> -#creat lsb image
> -if [ -f core-image-lsb-${MACHINE_ARCH}-test.ext3 ];then
> -	if [ -d lsbtmp ];then
> -    	sudo umount lsbtmp
> -	fi
> -	ECHO "Remove old lsb image..."
> -	/bin/rm core-image-lsb-${MACHINE_ARCH}-test.ext3
> -fi	
> -ECHO "creat a big ext3 file for lsb image with 5G..."
> -dd if=/dev/zero of=core-image-lsb-${MACHINE_ARCH}-test.ext3 bs=1M count=5000
> -exit_check
> -ECHO "Format ext3 image,please input \"y\""
> -mkfs.ext3 core-image-lsb-${MACHINE_ARCH}-test.ext3
> -tune2fs -j  core-image-lsb-${MACHINE_ARCH}-test.ext3
> -
> -
> -ECHO "get a lsb image with lsb test suite"
> -if [ ! -d lsbtmp ];then
> -	mkdir lsbtmp
> -fi
> -
> -
> -#install file system and lsb test suite to lsb image
> -sudo mount -o loop core-image-lsb-${MACHINE_ARCH}-test.ext3 lsbtmp
> -exit_check
> -
> -ECHO "  ->Install file system..."
> -sudo tar jxf core-image-lsb-${MACHINE_ARCH}-${PN}.rootfs.tar.bz2 -C lsbtmp
> -exit_check
> -
> -ECHO "  ->Install lsb test suite..."
> -cd lsb-test-suite-${MACHINE_ARCH}
> -sudo tar zxf lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz -C ../lsbtmp
> -exit_check
> -sudo mkdir ../lsbtmp/lsb-Application
> -sudo cp *.rpm ../lsbtmp/lsb-Application
> -exit_check
> -cd ..
> -
> -if [ -f modules-*-${MACHINE_ARCH}.tgz ];then
> -ECHO "  ->Install moules of driver..."	
> -	sudo tar zxf modules-*-${MACHINE_ARCH}.tgz -C lsbtmp/
> -fi
> -
> -
> -#unmount lsbtmp
> -sudo umount lsbtmp
> -exit_check
> -sudo rm -rf lsbtmp
> -
> -#change file attribute
> -sudo chown ${USER}:${USER} core-image-lsb-${MACHINE_ARCH}-test.ext3 
> -exit_check
> -sudo chmod 755 core-image-lsb-${MACHINE_ARCH}-test.ext3
> -exit_check
> -
> -#set up link
> -if [ -L core-image-lsb-${MACHINE_ARCH}.ext3 ];then
> -ECHO "Set up link"
> -    /bin/rm core-image-lsb-${MACHINE_ARCH}.ext3
> -    exit_check
> -fi
> -ln -s core-image-lsb-${MACHINE_ARCH}-test.ext3 core-image-lsb-${MACHINE_ARCH}.ext3
> -
> -ECHO "LSB test environment is set successfully, Please run this image on platform ${MACHINE_ARCH}"
> -
> diff --git a/scripts/create-lsb-image b/scripts/create-lsb-image
> new file mode 100755
> index 0000000..94cb337
> --- /dev/null
> +++ b/scripts/create-lsb-image
> @@ -0,0 +1,228 @@
> +#!/bin/bash
> +#
> +# Copyright (C) 2010-2011 Wind River Systems, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> +# See the GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
> +
> +
> +red='\E[31;40m'
> +green='\E[32;40m'
> +
> +#Get current owner
> +OWNER=`whoami` 
> +#Get group 
> +GROUP=`id -gn ${USER}`
> +MACHINE_ARCH=`bitbake -e | sed -n 's/^MACHINE_ARCH=\"\(.*\)\"/\1/p'`
> +DEPLOY_DIR_IMAGE=`bitbake -e | sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p'`
> +#Get value of varibale MACHINE_INE and DEPLOY_DIR_IMAGE
> +LSB_IMAGE=poky-image-lsb-${MACHINE_ARCH}-test.ext3
> +
> +ECHO()
> +{
> +    echo -e "${green}$@"
> +    tput sgr0
> +}
> +
> +ERROR()
> +{
> +    echo -e "${red}$@"
> +    tput sgr0
> +    exit 1
> +}
> +
> +exit_check()
> +{
> +    [ $? -ne 0 ] && exit $? 
> +}
> +
> +usage()
> +{
> +    ECHO "Usage: PC\$ create-lsb-image ARCH ROOTFS_IMAGE"
> +    ECHO "       ARCH: x86 or x86-64 or ppc32"
> +    ECHO "       ROOTFS_IMAGE: \
> +Name of the rootfs image with suffix \"tar.bz2\""
> +
> +
> +    ECHO ""
> +    ECHO "Examples:"
> +    ECHO "       PC\$ creat-lsb-image \
> +x86 poky-image-lsb-qemux86-20110317030443.rootfs.tar.bz2"
> +    exit 1
> +}
> +
> +#There should be two parameters to get machine type and name of image
> +if [ $# -ne 2 ]; then
> +    usage
> +fi
> +
> +#Get list for lsb test suite
> +case ${1} in
> +"x86")
> +    T_ARCH=ia32
> +    P_ARCH=i486
> +    COM_PACKAGE_LIST="lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz"
> +    ;;
> +"x86-64")
> +    T_ARCH=amd64
> +    P_ARCH=x86_64
> +    MACHINE_ARCH=${MACHINE_ARCH/x86_64/x86-64}
> +    COM_PACKAGE_LIST="lsb-dist-testkit-4.1.0-5.${P_ARCH}.tar.gz"
> +    ;;
> +"ppc32")
> +    P_ARCH=ppc
> +    T_ARCH=${ARCH}
> +    COM_PACKAGE_LIST="lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz"
> +    ;;
> +*)
> +   usage
> +   ;;
> +esac
> +
> +APP_PACKAGE_RPMLIST="lsb-apache-2.2.14-3.lsb4.${P_ARCH}.rpm \
> +                     lsb-tcl-8.5.7-6.lsb4.${P_ARCH}.rpm \
> +                     lsb-expect-5.43.0-11.lsb4.${P_ARCH}.rpm \
> +                     lsb-groff-1.20.1-5.lsb4.${P_ARCH}.rpm \
> +                     lsb-raptor-1.4.19-3.lsb4.${P_ARCH}.rpm \
> +                     lsb-xpdf-1.01-10.lsb4.${P_ARCH}.rpm \
> +                     lsb-samba-3.4.3-5.lsb4.${P_ARCH}.rpm \
> +                     lsb-rsync-3.0.6-3.lsb4.${P_ARCH}.rpm"
> +
> +APP_PACKAGE_SOURCELIST="expect-tests.tar \
> +                        tcl-tests.tar \
> +                        raptor-tests.tar \
> +                        test1.pdf \
> +                        test2.pdf"
> +
> +PACKAGE_LIST="${COM_PACKAGE_LIST} \
> +              ${APP_PACKAGE_RPMLIST} \
> +              ${APP_PACKAGE_SOURCELIST}"
> +
> +#Version for lsb test suite
> +RELEASE=released-4.1.0 
> +#Tools of download packages 
> +WGET="wget -c -t 5" 
> +SERVER1="\
> +http://ftp.linuxfoundation.org/pub/lsb/bundles/${RELEASE}/dist-testkit" 
> +SERVER2="\
> +http://ftp.linux-foundation.org/pub/lsb/app-battery/${RELEASE}/${T_ARCH}"
> +SERVER3="http://ftp.linuxfoundation.org/pub/lsb/snapshots/appbat/tests"
> +
> +
> +#Function for downloading package from URL pointed
> +download()
> +{
> +
> +    for i in $@; do
> +        ECHO "  -->Downloading package \"${i}\""
> +        PACKAGE_NAME=${i}
> +        suffix=${PACKAGE_NAME##*.}
> +        if [ "$suffix" = "gz" ];then
> +            ${WGET} ${SERVER1}/${i}
> +        elif [ "$suffix" = "rpm" ];then
> +            ${WGET} ${SERVER2}/${i}
> +        else
> +            ${WGET} ${SERVER3}/${i}
> +        fi
> +    done
> +}
> +
> +#Check lsb image
> +[ ! -d $DEPLOY_DIR_IMAGE ] && ERROR "\ 
> +Image directory does not exist: ${DEPLOY_DIR_IMAGE}"
> +
> +ECHO "Entering directory $DEPLOY_DIR_IMAGE"
> +cd $DEPLOY_DIR_IMAGE
> +
> +if [ ! -f ${2} ]; then
> +    ECHO "rootfs image \"${2}\" not found in ${DEPLOY_DIR_IMAGE}"
> +    ECHO "Please copy \"${2}\" to \"${DEPLOY_DIR_IMAGE}\""
> +    exit 1
> +fi
> +
> +#Umount lsbtmp 
> +[ ! -d lsbtmp ] && mkdir lsbtmp 
> + 
> +#Download lsb test suite
> +mkdir -p lsb-test-suite-${MACHINE_ARCH} || \
> +ERROR "Couldn't find lsb test suite for ${MACHINE_ARCH}"
> +cd lsb-test-suite-${MACHINE_ARCH}
> +ECHO "Downloading lsb test suite, it would take some time..."
> +download ${PACKAGE_LIST}
> +
> +cd ..
> +
> +#Creat lsb image
> +if [ -f ${LSB_IMAGE} ];then
> +    sudo umount lsbtmp > /dev/null 2>&1
> +    ECHO "Removing old lsb image..."
> +    /bin/rm ${LSB_IMAGE} > /dev/null 2>&1
> +fi	
> +
> +ECHO "Creating a 8GB file for the lsb image"
> +dd if=/dev/zero of=${LSB_IMAGE} bs=1M count=8000 > /dev/null 2>&1
> +exit_check
> +
> +ECHO "Formatting ext3 image..."
> +mkfs.ext3 -q -F ${LSB_IMAGE} > /dev/null 2>&1
> +tune2fs -j  ${LSB_IMAGE} > /dev/null 2>&1
> +
> +
> +ECHO "Generating final image"
> +[ ! -d lsbtmp ] && mkdir lsbtmp
> +
> +
> +#Install file system and lsb test suite to lsb image
> +sudo mount -o loop ${LSB_IMAGE} lsbtmp
> +exit_check
> +
> +ECHO "  ->Installing rootfs..."
> +sudo tar jpxf ${2} -C lsbtmp
> +exit_check
> +
> +ECHO "  ->Installing lsb test suite..."
> +cd lsb-test-suite-${MACHINE_ARCH}
> +if [ "${1}" = "x86-64" ]; then
> +    sudo tar zpxf lsb-dist-testkit-4.1.0-5.${P_ARCH}.tar.gz -C ../lsbtmp
> +else
> +    sudo tar zpxf lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz -C ../lsbtmp
> +fi
> +exit_check
> +
> +sudo mkdir ../lsbtmp/lsb-Application
> +sudo cp *.rpm *.tar *.pdf ../lsbtmp/lsb-Application
> +exit_check
> +cd ..
> +
> +if [ -f modules-*-${MACHINE_ARCH}.tgz ];then
> +ECHO "  ->Installing moudles of driver..."	
> +    sudo tar zpxf modules-*-${MACHINE_ARCH}.tgz -C lsbtmp/
> +fi
> +
> +
> +#Unmount lsbtmp
> +sudo umount lsbtmp
> +exit_check
> +sudo rm -rf lsbtmp
> +
> +#Change file attribute
> +sudo chown ${OWNER}:${GROUP} ${LSB_IMAGE} 
> +exit_check
> +sudo chmod 755 ${LSB_IMAGE}
> +exit_check
> +
> +#Set up link
> +ln -sf ${LSB_IMAGE} poky-image-lsb-${MACHINE_ARCH}.ext3
> +
> +ECHO "The LSB test environment has been setup successfully."
> +ECHO "Please run this image on platform ${MACHINE_ARCH}"




