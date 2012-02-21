Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rzw9b-0005PN-Ec
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 21:17:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Feb 2012 12:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127852496"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2012 12:09:18 -0800
Message-ID: <4F43F9EE.5080608@linux.intel.com>
Date: Tue, 21 Feb 2012 12:09:18 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329456260.git.yi.zhao@windriver.com>
	<ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
In-Reply-To: <ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
Subject: Re: [PATCH 1/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 21 Feb 2012 20:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2012 10:02 PM, Yi Zhao wrote:
> The recipe is used for LSB tests. The script LSB_Test.sh does the
> following things:
> - setup LSB testing environment
> - download LSB rpm packages with list file packages_list from remote
> - install the packages
> - execute LSB testing with profile file session
> - collect the results
>
> Install packages_list and session files into ${D}/opt/lsb-test.
>
> [YOCTO #1567]
> ---
>   meta/recipes-extended/lsb/lsbtest/LSB_Test.sh   |  493 +++++++++++++++++++++++
>   meta/recipes-extended/lsb/lsbtest/packages_list |   50 +++
>   meta/recipes-extended/lsb/lsbtest/session       |  194 +++++++++
>   meta/recipes-extended/lsb/lsbtest_1.0.bb        |   36 ++
>   4 files changed, 773 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
>   create mode 100644 meta/recipes-extended/lsb/lsbtest/session
>   create mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb

I think you need to have a RDEPENDS on at a minimum for this lsbtest 
recipe since it relies on RPM to install the packages.

RDEPENDS = "rpm"



Sau!

>
> diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
> new file mode 100644
> index 0000000..a616f5e
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
> @@ -0,0 +1,493 @@
> +#!/bin/bash
> +
> +# Copyright (C) 2012 Wind River Systems, Inc.
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
> +WORK_DIR="/opt/lsb-test"
> +
> +if [ `id -u` -ne 0 ]
> +then
> +	cat<<  EOF
> +	In order to install and run LSB testsuite, you need administrator privileges.
> +	You are currently running this script as an unprivileged user.
> +
> +EOF
> +	exit 1
> +fi
> +
> +ARCH=`uname -m`
> +if [ ${ARCH} != "i686" ]&&  [ ${ARCH} != "x86_64" ]&&  [ ${ARCH} != "ppc" ]
> +then
> +	echo "Error: Unsupported architecture"
> +	exit 1
> +fi
> +
> +RET=0
> +
> +cd ${WORK_DIR} || exit 1
> +# Step 1: Download the LSB Packages
> +echo ""
> +echo "Download LSB packages..."
> +echo ""
> +
> +if [ ! -e ./packages_list ]
> +then
> +	echo "Error: Could not find packages list">&2
> +	exit 1
> +fi
> +
> +. ./packages_list
> +
> +PACKAGES_DIR="/var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb"
> +
> +BASE_PACKAGES_DIR="${PACKAGES_DIR}/base/${LSB_RELEASE}/binary"
> +RUNTIME_BASE_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/released-all/binary/runtime"
> +RUNTIME_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/${LSB_RELEASE}/binary/runtime"
> +APP_PACKAGES_DIR="${PACKAGES_DIR}/app-battery/${LSB_RELEASE}/${LSB_ARCH}"
> +APP_TESTFILES_DIR="${PACKAGES_DIR}/app-battery/tests"
> +SNAPSHOTS_TESTFILES_DIR="${PACKAGES_DIR}/snapshots/appbat/tests"
> +
> +if [ ! -d ${PACKAGES_DIR} ]
> +then
> +	mkdir -p ${PACKAGES_DIR}
> +fi
> +
> +if [ ! -d ${BASE_PACKAGES_DIR} ]
> +then
> +	mkdir -p ${BASE_PACKAGES_DIR}
> +fi
> +
> +if [ ! -d ${RUNTIME_BASE_PACKAGES_DIR} ]
> +then
> +	mkdir -p ${RUNTIME_BASE_PACKAGES_DIR}
> +fi
> +
> +if [ ! -d ${RUNTIME_PACKAGES_DIR} ]
> +then
> +	mkdir -p ${RUNTIME_PACKAGES_DIR}
> +fi
> +
> +if [ ! -d ${APP_PACKAGES_DIR} ]
> +then
> +	mkdir -p ${APP_PACKAGES_DIR}
> +fi
> +
> +if [ ! -d ${APP_TESTFILES_DIR} ]
> +then
> +	mkdir -p ${APP_TESTFILES_DIR}
> +fi
> +
> +# Official download server list. You can replace them with your own server.
> +SERVER_IPADDR="140.211.169.23"
> +SERVER_NAME="ftp.linuxfoundation.org"
> +
> +if ! `grep -F -q "${SERVER_NAME}" /etc/hosts`; then
> +	echo "${SERVER_IPADDR}	${SERVER_NAME}	${SERVER_NAME}">>  /etc/hosts
> +fi
> +
> +#ping -c 5 ${SERVER_NAME}
> +#if [ $? -ne 0 ]
> +#then
> +#	echo "The server: ${SERVER_NAME} is unreachable"
> +#	exit 1
> +#fi
> +
> +SERVER1="\
> +	http://${SERVER_NAME}/pub/lsb/base/${LSB_RELEASE}/binary"
> +SERVER2="\
> +	http://${SERVER_NAME}/pub/lsb/test_suites/released-all/binary/runtime"
> +SERVER3="\
> +	http://${SERVER_NAME}/pub/lsb/test_suites/${LSB_RELEASE}/binary/runtime"
> +SERVER4="\
> +	http://${SERVER_NAME}/pub/lsb/app-battery/${LSB_RELEASE}/${LSB_ARCH}"
> +SERVER5="\
> +	http://${SERVER_NAME}/pub/lsb/app-battery/tests"
> +
> +# We using "curl" as a download tool, "wget" is an alternative.
> +CURL=`which curl`
> +WGET=`which wget`
> +if [ ! -z ${CURL} ]
> +then
> +	DOWNLOAD_CMD="${CURL} -R -L --retry 3 --retry-delay 4 --connect-timeout 180 --compressed -C - -o"
> +elif [ ! -z ${WGET} ]
> +then
> +	DOWNLOAD_CMD="${WGET} -c -t 5 -O"
> +else
> +	echo "Can not find a download tool, please install curl or wget."
> +	exit 1
> +fi
> +
> +cd ${BASE_PACKAGES_DIR}
> +for pkg in ${BASE_PACKAGES_LIST}; do
> +	if [ ! -f ${pkg} ]
> +	then
> +		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER1}/${pkg}>  /dev/null 2>&1
> +		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER1}/${pkg}
> +		if [ $? -eq 0 ]
> +		then
> +			mv -f ${pkg}".#part" ${pkg}
> +			echo "Download ${pkg} successfully."
> +		else
> +			echo "Download ${pkg} failed."
> +			RET=1
> +		fi
> +	fi
> +done
> +
> +cd ${RUNTIME_BASE_PACKAGES_DIR}
> +for pkg in ${RUNTIME_BASE_PACKAGES_LIST}; do
> +	if [ ! -f ${pkg} ]
> +	then
> +		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER2}/${pkg}>  /dev/null 2>&1
> +		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER2}/${pkg}
> +		if [ $? -eq 0 ]
> +		then
> +			mv -f ${pkg}".#part" ${pkg}
> +			echo "Download ${pkg} successfully."
> +		else
> +			echo "Download ${pkg} failed."
> +			RET=1
> +		fi
> +	fi
> +done
> +
> +cd ${RUNTIME_PACKAGES_DIR}
> +for pkg in ${RUNTIME_PACKAGES_LIST}; do
> +	if [ ! -f ${pkg} ]
> +	then
> +		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER3}/${pkg}>  /dev/null 2>&1
> +		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER3}/${pkg}
> +		if [ $? -eq 0 ]
> +		then
> +			mv -f ${pkg}".#part" ${pkg}
> +			echo "Download ${pkg} successfully."
> +		else
> +			echo "Download ${pkg} failed."
> +			RET=1
> +		fi
> +	fi
> +done
> +
> +cd ${APP_PACKAGES_DIR}
> +for pkg in ${APP_PACKAGES_LIST}; do
> +	if [ ! -f ${pkg} ]
> +	then
> +		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER4}/${pkg}>  /dev/null 2>&1
> +		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER4}/${pkg}
> +		if [ $? -eq 0 ]
> +		then
> +			mv -f ${pkg}".#part" ${pkg}
> +			echo "Download ${pkg} successfully."
> +		else
> +			echo "Download ${pkg} failed."
> +			RET=1
> +		fi
> +	fi
> +done
> +
> +cd ${APP_TESTFILES_DIR}
> +for pkg in ${APP_TESTFILES_LIST}; do
> +	if [ ! -f ${pkg} ]
> +	then
> +		#${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER5}/${pkg}>  /dev/null 2>&1
> +		${DOWNLOAD_CMD} ${pkg}".#part" ${SERVER5}/${pkg}
> +		if [ $? -eq 0 ]
> +		then
> +			mv -f ${pkg}".#part" ${pkg}
> +			echo "Download ${pkg} successfully."
> +		else
> +			echo "Download ${pkg} failed."
> +			RET=1
> +		fi
> +	fi
> +done
> +
> +if [ ${RET} -ne 0 ]
> +then
> +	echo "Download some packages failed. Please download them again."
> +	exit 1
> +fi
> +
> +# Step 2: Install the LSB Packages
> +echo ""
> +echo "Install LSB packages..."
> +echo ""
> +
> +# Kill lighttpd
> +ps aux | grep "lighttpd" | grep -v -q "grep"
> +if [ $? -eq 0 ]
> +then
> +	killall lighttpd>/dev/null 2>&1
> +fi
> +
> +# Start avahi-daemon
> +ps aux | grep "avahi-daemon" | grep -v -q "grep"
> +if [ $? -ne 0 ]
> +then
> +	/etc/init.d/avahi-daemon start>/dev/null 2>&1
> +fi
> +
> +LSB_START_CMD="/opt/lsb/test/manager/bin/dist-checker-start.pl"
> +LSB_STOP_CMD="/opt/lsb/test/manager/bin/dist-checker-stop.pl"
> +
> +PLATFORM_FILE="/etc/rpm/platform"
> +
> +RPM_INSTALL_CMD="rpm --quiet --nodeps --replacepkgs --nosignature -i"
> +RPM_INSTALL_CMD_NOSCRIPTS="rpm --quiet --nodeps --replacepkgs --noscripts --nosignature -i"
> +
> +# If the lsb has been started, stop it first.
> +if [ -x ${LSB_STOP_CMD} ]
> +then
> +	${LSB_STOP_CMD}
> +fi
> +
> +if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
> +	if [ ${ARCH} == i686 ];then
> +		echo "i486-suse">>  ${PLATFORM_FILE}
> +		echo "i486-noarch">>  ${PLATFORM_FILE}
> +		echo "i486-pc">>  ${PLATFORM_FILE}
> +		echo "noarch-suse">>  ${PLATFORM_FILE}
> +	else
> +		echo "${ARCH}-suse">>  ${PLATFORM_FILE}
> +		echo "${ARCH}-noarch">>  ${PLATFORM_FILE}
> +		echo "${ARCH}-pc">>  ${PLATFORM_FILE}
> +		echo "noarch-suse">>  ${PLATFORM_FILE}
> +	fi
> +fi
> +
> +if [ -d ${BASE_PACKAGES_DIR} ]
> +then
> +	cd ${BASE_PACKAGES_DIR}
> +	for pkg in ${BASE_PACKAGES_LIST}
> +	do
> +		rpm --quiet -q ${pkg%\.*}
> +		if [ $? -ne 0 ]; then
> +			$RPM_INSTALL_CMD ${pkg}
> +		fi
> +	done
> +fi
> +
> +if [ -d ${RUNTIME_BASE_PACKAGES_DIR} ]
> +then
> +	cd ${RUNTIME_BASE_PACKAGES_DIR}
> +	for pkg in ${RUNTIME_BASE_PACKAGES_LIST}
> +	do
> +		rpm --quiet -q ${pkg%\.*}
> +		if [ $? -ne 0 ]; then
> +			$RPM_INSTALL_CMD ${pkg}
> +		fi
> +	done
> +fi
> +
> +if [ -d ${RUNTIME_PACKAGES_DIR} ]
> +then
> +	cd ${RUNTIME_PACKAGES_DIR}
> +	for pkg in ${RUNTIME_PACKAGES_LIST}
> +	do
> +		rpm --quiet -q ${pkg%\.*}
> +		if [ $? -ne 0 ]; then
> +			$RPM_INSTALL_CMD ${pkg}
> +		fi
> +	done
> +fi
> +
> +if [ -d ${APP_PACKAGES_DIR} ]
> +then
> +	cd ${APP_PACKAGES_DIR}
> +	for pkg in ${APP_PACKAGES_LIST}
> +	do
> +		echo "${pkg}" | grep -q "apache\|xpdf"
> +		if [ $? -eq 0 ]
> +		then
> +			rpm --quiet -q ${pkg%\.*}
> +			if [ $? -ne 0 ]; then
> +				$RPM_INSTALL_CMD_NOSCRIPTS ${pkg}
> +			fi
> +		else
> +			rpm --quiet -q ${pkg%\.*}
> +			if [ $? -ne 0 ]; then
> +				$RPM_INSTALL_CMD ${pkg}
> +			fi
> +		fi
> +	done
> +fi
> +
> +if [ ! -d ${SNAPSHOTS_TESTFILES_DIR} ]
> +then
> +	mkdir -p ${SNAPSHOTS_TESTFILES_DIR}
> +fi
> +
> +if [ -d ${APP_TESTFILES_DIR} ]
> +then
> +	cd ${APP_TESTFILES_DIR}
> +	for pkg in ${APP_TESTFILES_LIST}
> +	do
> +		cp -f ${pkg} ${SNAPSHOTS_TESTFILES_DIR}
> +	done
> +fi
> +
> +cd ${WORK_DIR}
> +
> +# Step 3: Set environment
> +echo ""
> +echo "Set environment..."
> +echo ""
> +
> +check ()
> +{
> +	if [ $? -eq 0 ]
> +	then
> +		echo "PASS"
> +	else
> +		echo "FAIL"
> +		exit 1
> +	fi
> +}
> +
> +echo ""
> +echo "---------------------------------"
> +echo "Create the Dirnames on target"
> +
> +if [ ! -d /etc/rpm/sysinfo ]
> +then
> +	mkdir -pv /etc/rpm/sysinfo
> +fi
> +
> +cat>  /etc/rpm/sysinfo/Dirnames<<  EOF
> +/etc/opt/lsb
> +/home/tet/LSB.tools
> +/opt/lsb-tet3-lite/lib/ksh
> +/opt/lsb-tet3-lite/lib/perl
> +/opt/lsb-tet3-lite/lib/posix_sh
> +/opt/lsb-tet3-lite/lib/tet3
> +/opt/lsb-tet3-lite/lib/xpg3sh
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm/external
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm/external/DocumentTemplate
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm/test
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/classes
> +/opt/lsb/appbat/lib/python2.4/site-packages/qm/test/web
> +/opt/lsb/test/doc
> +/opt/lsb/test/lib
> +/opt/lsb/test/qm/diagnostics
> +/opt/lsb/test/qm/doc
> +/opt/lsb/test/qm/doc/test/html
> +/opt/lsb/test/qm/doc/test/print
> +/opt/lsb/test/qm/dtml
> +/opt/lsb/test/qm/dtml/test
> +/opt/lsb/test/qm/messages/test
> +/opt/lsb/test/qm/tutorial/test/tdb
> +/opt/lsb/test/qm/tutorial/test/tdb/QMTest
> +/opt/lsb/test/qm/web
> +/opt/lsb/test/qm/web/images
> +/opt/lsb/test/qm/web/stylesheets
> +/opt/lsb/test/qm/xml
> +/opt/lsb/test/share
> +/usr/share/doc/lsb-runtime-test
> +/var/opt/lsb
> +/opt/lsb/test/desktop
> +/opt/lsb/test/desktop/fontconfig
> +/opt/lsb/test/desktop/freetype
> +/opt/lsb/test/desktop/gtkvts
> +/opt/lsb/test/desktop/libpng
> +/opt/lsb/test/desktop/qt3
> +/opt/lsb/test/desktop/xft
> +/opt/lsb/test/desktop/xml
> +/opt/lsb/test/desktop/xrender
> +
> +
> +EOF
> +
> +if [ -f /etc/rpm/sysinfo/Dirnames ]
> +then
> +	echo "Success to creat Dirnames file"
> +else
> +	echo "Fail to creat Dirnames file"
> +fi
> +
> +echo ""
> +echo "---------------------------------"
> +echo "Update cache"
> +ldconfig
> +check;
> +
> +# Check loop device
> +if [ ! -b /dev/loop0 ]
> +then
> +	insmod /lib/modules/`uname -r`/kernel/drivers/block/loop.ko
> +	if [ $? != 0 ];then
> +		echo "Insmod loop.ko failed."
> +	fi
> +fi
> +
> +# Resolve localhost
> +LOCALHOST=`hostname`
> +if ! `grep -F -q "$LOCALHOST" /etc/hosts`; then
> +	echo "127.0.0.1	$LOCALHOST">>  /etc/hosts
> +fi
> +
> +# Workaround to add part of locales for LSB test
> +localedef -i de_DE -f ISO-8859-1 de_DE
> +localedef -i de_DE -f ISO-8859-15 de_DE.ISO-8859-15
> +localedef -i de_DE -f UTF-8 de_DE.UTF-8
> +localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
> +localedef -i en_HK -f ISO-8859-1 en_HK
> +localedef -i en_PH -f ISO-8859-1 en_PH
> +localedef -i en_US -f ISO-8859-15 en_US.ISO-8859-15
> +localedef -i en_US -f ISO-8859-1 en_US.ISO-8859-1
> +localedef -i en_US -f ISO-8859-1 en_US
> +localedef -i en_US -f UTF-8 en_US.UTF-8
> +localedef -i en_US -f ISO-8859-1 en_US.ISO8859-1
> +localedef -i es_MX -f ISO-8859-1 es_MX
> +localedef -i fr_FR -f ISO-8859-1 fr_FR
> +localedef -i it_IT -f ISO-8859-1 it_IT
> +localedef -i ja_JP -f EUC-JP ja_JP.eucjp
> +localedef -i se_NO -f UTF-8 se_NO.UTF-8
> +localedef -i ta_IN -f UTF-8 ta_IN
> +
> +echo ""
> +echo "Installation done!"
> +echo ""
> +
> +# Step 4: Start LSB test
> +if [ -x ${LSB_START_CMD} ]
> +then
> +	${LSB_START_CMD}
> +fi
> +
> +echo "---------------------------------"
> +echo "Run all the certification version of LSB Tests"
> +echo "---------------------------------"
> +
> +LSB_DIST_CHECKER="/opt/lsb/test/manager/utils/dist-checker.pl"
> +SESSION="${WORK_DIR}/session"
> +if [ ! -e ${SESSION} ]
> +then
> +	echo "Error: Could not find session file."
> +	echo "You must run LSB test from webbrower."
> +	exit 1
> +fi
> +
> +if [ -x ${LSB_DIST_CHECKER} ]
> +then
> +	${LSB_DIST_CHECKER} -v2 -f ${SESSION}
> +	check
> +fi
> +
> +echo ""
> +echo "LSB test complete. Please check the log file in /var/opt/lsb/test/manager/results/"
> +echo ""
> +
> diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
> new file mode 100644
> index 0000000..9285ed9
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbtest/packages_list
> @@ -0,0 +1,50 @@
> +LSB_RELEASE="released-4.1.0"
> +LSB_ARCH="lsbarch"
> +
> +BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
> +
> +RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.1-2.targetarch.rpm \
> +	lsb-tet3-lite-3.7-15.lsb4.targetarch.rpm \
> +	lsb-tet3-lite-devel-3.7-15.lsb4.targetarch.rpm \
> +	lsb-xvfb-1.2.0-19.targetarch.rpm \
> +	"
> +
> +RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.0-1.targetarch.rpm \
> +	lsb-libchk-4.1.0-1.targetarch.rpm \
> +	lsb-qm-2.2-8.lsb4.targetarch.rpm \
> +	lsb-task-dist-testkit-4.1.0-1.noarch.rpm \
> +	lsb-test-core-4.1.0-1.targetarch.rpm \
> +	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
> +	lsb-test-desktop-4.1.0-2.targetarch.rpm \
> +	lsb-test-desktop-t2c-4.1.0-1.targetarch.rpm \
> +	lsb-test-libstdcpp-4.1.0-13.lsb4.targetarch.rpm \
> +	lsb-test-olver-core-4.1.0-1.targetarch.rpm \
> +	lsb-test-perl-4.1.0-1.noarch.rpm \
> +	lsb-test-printing-4.1.0-1.targetarch.rpm \
> +	lsb-test-python-4.1.1-2.targetarch.rpm \
> +	lsb-test-qt3-azov-4.1.0-1.targetarch.rpm \
> +	lsb-test-qt4-azov-4.1.0-1.targetarch.rpm \
> +	lsb-test-xts5-5.1.5-38.lsb4.targetarch.rpm \
> +	lsb-test-alsa-t2c-4.1.0-1.targetarch.rpm \
> +	lsb-test-core-t2c-4.1.0-1.targetarch.rpm \
> +	lsb-test-xml2-azov-4.1.0-1.targetarch.rpm \
> +	"
> +
> +APP_PACKAGES_LIST="lsb-python-2.4.6-5.lsb4.targetarch.rpm \
> +	lsb-apache-2.2.14-3.lsb4.targetarch.rpm \
> +	lsb-tcl-8.5.7-6.lsb4.targetarch.rpm \
> +	lsb-expect-5.43.0-11.lsb4.targetarch.rpm \
> +	lsb-groff-1.20.1-5.lsb4.targetarch.rpm \
> +	lsb-raptor-1.4.19-3.lsb4.targetarch.rpm \
> +	lsb-xpdf-1.01-10.lsb4.targetarch.rpm \
> +	lsb-samba-3.4.3-5.lsb4.targetarch.rpm \
> +	lsb-rsync-3.0.6-3.lsb4.targetarch.rpm \
> +	"
> +
> +APP_TESTFILES_LIST="expect-tests.tar \
> +	tcl-tests.tar \
> +	raptor-tests.tar \
> +	test1.pdf \
> +	test2.pdf \
> +	"
> +
> diff --git a/meta/recipes-extended/lsb/lsbtest/session b/meta/recipes-extended/lsb/lsbtest/session
> new file mode 100644
> index 0000000..85ca2ef
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbtest/session
> @@ -0,0 +1,194 @@
> +[GENERAL]
> +VERBOSE_LEVEL:   1
> +ARCHITECTURE:    targetarch
> +USE_INTERNET:    1
> +STD_VERSION:     LSB 4.1
> +STD_PROFILE:     no
> +[cmdchk]
> +RUN: 1
> +VERSION: local|*
> +
> +[libchk]
> +RUN: 1
> +VERSION: local|*
> +
> +[alsa-t2c]
> +RUN: 1
> +VERSION: local|*
> +
> +[alsa-t2c|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/alsa-t2c
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/alsa-t2c/results
> +
> +[core]
> +RUN: 1
> +VERSION: local|*
> +
> +[core|local|*]
> +AUTOREPLY_PROVIDES_BASH: n
> +AUTOREPLY_TESTRUN_PATH: /home/tet/test_sets
> +AUTOREPLY_PERSON: Automated
> +AUTOREPLY_KERNEL_NAME: vmlinuz
> +AUTOREPLY_INSTALL_LSBPAM_CONF: y
> +AUTOREPLY_PROVIDES_C_SHELL: n
> +AUTOREPLY_ORGANISATION: N/A
> +AUTOREPLY_SET_PASS_MIN_DAYS: y
> +AUTOREPLY_PROVIDES_SYSV_INIT:
> +AUTOREPLY_ISNTALL_DEVS: y
> +AUTOREPLY_SUPPORTS_FILE_CMD: y
> +AUTOREPLY_TEST_SYSTEM: Distribution Checker
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/core/tet/test_sets
> +AUTOREPLY_SUPPORTS_NLS: n
> +AUTOREPLY_SUPPORTS_PROCESS_ACCOUNTING: n
> +AUTOREPLY_PATH_TO_RC.D:
> +AUTOREPLY_ALLOWS_MAKEDEV: n
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/core/tet/test_sets/results
> +
> +[core-t2c]
> +RUN: 1
> +VERSION: local|*
> +
> +[core-t2c|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/core-t2c
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/core-t2c/results
> +
> +[cpp-t2c]
> +RUN: 1
> +VERSION: local|*
> +
> +[cpp-t2c|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/cpp-t2c
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/cpp-t2c/results
> +
> +[desktop]
> +RUN: 1
> +VERSION: local|*
> +
> +[desktop|local|*]
> +AUTOREPLY_DESKTOP_ENVIRONMENT: [default]
> +AUTOREPLY_PERSON: Automated
> +AUTOREPLY_X_CLIENT_HOSTNAME:
> +AUTOREPLY_TEST_SYSTEM: Distribution Checker
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/desktop
> +AUTOREPLY_X11_FONT_PATH: [default]
> +AUTOREPLY_SHOW_SUMMARY_REPORT:
> +AUTOREPLY_ORGANISATION: N/A
> +AUTOREPLY_XVFB_DISPLAY: [default]
> +
> +[desktop-t2c]
> +RUN: 1
> +VERSION: local|*
> +
> +[desktop-t2c|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/desktop-t2c
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/desktop-t2c/results
> +
> +[libstdcpp]
> +RUN: 1
> +VERSION: local|*
> +
> +[libstdcpp|local|*]
> +AUTOREPLY_TEST_SYSTEM: Distribution Checker
> +AUTOREPLY_PERSON: Automated
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/libstdcpp_4.1.0
> +AUTOREPLY_ORGANISATION: N/A
> +AUTOREPLY_GNU_TRIPLET:
> +
> +[olver]
> +RUN: 1
> +VERSION: local|*
> +
> +[olver|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/olver-core
> +AUTOREPLY_RESULTS_DIR: /var/opt/lsb/test/olver-core
> +
> +[perl]
> +RUN: 1
> +VERSION: local|*
> +
> +[perl|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/perl
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/perl/results
> +
> +[printing]
> +RUN: 1
> +VERSION: local|*
> +
> +[printing|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/printing
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/printing/results
> +
> +[python]
> +RUN: 1
> +VERSION: local|*
> +
> +[python|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/python
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/python/results
> +
> +[qt3-azov]
> +RUN: 1
> +VERSION: local|*
> +
> +[qt3-azov|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/qt3-azov
> +AUTOREPLY_X11_FONT_PATH: [default]
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/qt3-azov/results
> +
> +[qt4-azov]
> +RUN: 1
> +VERSION: local|*
> +
> +[qt4-azov|local|*]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/qt4-azov
> +AUTOREPLY_X11_FONT_PATH: [default]
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/qt4-azov/results
> +
> +[xml2-azov]
> +RUN: 1
> +VERSION: local|*
> +
> +[xts5]
> +RUN: 1
> +VERSION: local|*
> +
> +[xts5|local|*]
> +AUTOREPLY_XT_FONTPATH_GOOD: [default]
> +AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/xts5
> +AUTOREPLY_XVFB_DISPLAY: [default]
> +AUTOREPLY_RESULTS_DIR: /opt/lsb/test/xts5/xts5/results
> +AUTOREPLY_XT_FONTPATH: [default]
> +AUTOREPLY_X_CLIENT_HOSTNAME:
> +
> +[apache]
> +RUN: 1
> +VERSION: local|*
> +
> +[expect]
> +RUN: 1
> +VERSION: local|*
> +
> +[groff]
> +RUN: 1
> +VERSION: local|*
> +
> +[raptor]
> +RUN: 1
> +VERSION: local|*
> +
> +[rsync]
> +RUN: 1
> +VERSION: local|*
> +
> +[samba]
> +RUN: 1
> +VERSION: local|*
> +
> +[tcl]
> +RUN: 1
> +VERSION: local|*
> +
> +[xpdf]
> +RUN: 1
> +VERSION: local|*
> +
> diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
> new file mode 100644
> index 0000000..cf3dcd5
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "automate test for lsb"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://LSB_Test.sh;beginline=3;endline=16;md5=7063bb54b04719df0716b513447f4fc0"
> +
> +SRC_URI = "file://LSB_Test.sh \
> +		   file://packages_list \
> +		   file://session \
> +		   "
> +
> +S=${WORKDIR}
> +
> +do_install() {
> +	install -d ${D}/usr/bin
> +	install -m 0755 ${S}/LSB_Test.sh ${D}/usr/bin
> +	install -d  ${D}/opt/lsb-test
> +	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
> +	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
> +	if [ "${TARGET_ARCH}" == "i586" ];then
> +		sed -i -e 's/lsbarch/ia32/g' -e 's/targetarch/i486/g' ${D}/opt/lsb-test/packages_list
> +		sed -i -e 's/targetarch/x86/g' ${D}/opt/lsb-test/session
> +	fi
> +	if [ "${TARGET_ARCH}" == "x86_64" ];then
> +		sed -i -e 's/lsbarch/amd64/g' -e 's/targetarch/x86_64/g' ${D}/opt/lsb-test/packages_list
> +		sed -i -e 's/targetarch/x86-64/g' ${D}/opt/lsb-test/session
> +	fi
> +	if [ "${TARGET_ARCH}" == "powerpc" ];then
> +		sed -i -e 's/lsbarch/ppc32/g' -e 's/targetarch/ppc/g' ${D}/opt/lsb-test/packages_list
> +		sed -i -e 's/targetarch/PPC32/g' ${D}/opt/lsb-test/session
> +	fi
> +}
> +
> +FILES_${PN} += "/opt/lsb-test/* \
> +               "


