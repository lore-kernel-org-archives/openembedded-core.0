Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 430566B7D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 02:33:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5N2X6gX027116
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 19:33:06 -0700 (PDT)
Received: from pek-kkang-d1.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 22 Jun 2014 19:33:05 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 10:32:49 +0800
Message-ID: <d3a0d02700814ceefeb277bed3b5c0329bf05a9b.1403490121.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/5] iptables: add init script and configure file
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
X-List-Received-Date: Mon, 23 Jun 2014 02:33:05 -0000
Content-Type: text/plain

Add init script and related configure file for iptables from RedHat 6
package iptables version 1.4.7.

Remove trailing white spaces.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../iptables/iptables/iptables-config              |  54 +++
 .../iptables/iptables/iptables.init                | 445 +++++++++++++++++++++
 2 files changed, 499 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables-config
 create mode 100755 meta/recipes-extended/iptables/iptables/iptables.init

diff --git a/meta/recipes-extended/iptables/iptables/iptables-config b/meta/recipes-extended/iptables/iptables/iptables-config
new file mode 100644
index 0000000..d9f6c34
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables-config
@@ -0,0 +1,54 @@
+# Load additional iptables modules (nat helpers)
+#   Default: -none-
+# Space separated list of nat helpers (e.g. 'ip_nat_ftp ip_nat_irc'), which
+# are loaded after the firewall rules are applied. Options for the helpers are
+# stored in /etc/modprobe.conf.
+IPTABLES_MODULES=""
+
+# Unload modules on restart and stop
+#   Value: yes|no,  default: yes
+# This option has to be 'yes' to get to a sane state for a firewall
+# restart or stop. Only set to 'no' if there are problems unloading netfilter
+# modules.
+IPTABLES_MODULES_UNLOAD="yes"
+
+# Save current firewall rules on stop.
+#   Value: yes|no,  default: no
+# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets stopped
+# (e.g. on system shutdown).
+IPTABLES_SAVE_ON_STOP="no"
+
+# Save current firewall rules on restart.
+#   Value: yes|no,  default: no
+# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets
+# restarted.
+IPTABLES_SAVE_ON_RESTART="no"
+
+# Save (and restore) rule and chain counter.
+#   Value: yes|no,  default: no
+# Save counters for rules and chains to /etc/sysconfig/iptables if
+# 'service iptables save' is called or on stop or restart if SAVE_ON_STOP or
+# SAVE_ON_RESTART is enabled.
+IPTABLES_SAVE_COUNTER="no"
+
+# Numeric status output
+#   Value: yes|no,  default: yes
+# Print IP addresses and port numbers in numeric format in the status output.
+IPTABLES_STATUS_NUMERIC="yes"
+
+# Verbose status output
+#   Value: yes|no,  default: yes
+# Print info about the number of packets and bytes plus the "input-" and
+# "outputdevice" in the status output.
+IPTABLES_STATUS_VERBOSE="no"
+
+# Status output with numbered lines
+#   Value: yes|no,  default: yes
+# Print a counter/number for every rule in the status output.
+IPTABLES_STATUS_LINENUMBERS="yes"
+
+# Reload sysctl settings on start and restart
+#   Default: -none-
+# Space separated list of sysctl items which are to be reloaded on start.
+# List items will be matched by fgrep.
+#IPTABLES_SYSCTL_LOAD_LIST=".nf_conntrack .bridge-nf"
diff --git a/meta/recipes-extended/iptables/iptables/iptables.init b/meta/recipes-extended/iptables/iptables/iptables.init
new file mode 100755
index 0000000..01057dd
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.init
@@ -0,0 +1,445 @@
+#!/bin/sh
+#
+# iptables	Start iptables firewall
+#
+# chkconfig: 2345 08 92
+# description:	Starts, stops and saves iptables firewall
+#
+# config: /etc/sysconfig/iptables
+# config: /etc/sysconfig/iptables-config
+#
+### BEGIN INIT INFO
+# Provides: iptables
+# Required-Start:
+# Required-Stop:
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: start and stop iptables firewall
+# Description: Start, stop and save iptables firewall
+### END INIT INFO
+
+# Source function library.
+. /etc/init.d/functions
+
+IPTABLES=iptables
+IPTABLES_DATA=/etc/sysconfig/$IPTABLES
+IPTABLES_FALLBACK_DATA=${IPTABLES_DATA}.fallback
+IPTABLES_CONFIG=/etc/sysconfig/${IPTABLES}-config
+IPV=${IPTABLES%tables} # ip for ipv4 | ip6 for ipv6
+[ "$IPV" = "ip" ] && _IPV="ipv4" || _IPV="ipv6"
+PROC_IPTABLES_NAMES=/proc/net/${IPV}_tables_names
+VAR_SUBSYS_IPTABLES=/var/lock/subsys/$IPTABLES
+
+# only usable for root
+[ $EUID = 0 ] || exit 4
+
+if [ ! -x /sbin/$IPTABLES ]; then
+    echo -n $"${IPTABLES}: /sbin/$IPTABLES does not exist."; warning; echo
+    exit 5
+fi
+
+# Old or new modutils
+/sbin/modprobe --version 2>&1 | grep -q module-init-tools \
+    && NEW_MODUTILS=1 \
+    || NEW_MODUTILS=0
+
+# Default firewall configuration:
+IPTABLES_MODULES=""
+IPTABLES_MODULES_UNLOAD="yes"
+IPTABLES_SAVE_ON_STOP="no"
+IPTABLES_SAVE_ON_RESTART="no"
+IPTABLES_SAVE_COUNTER="no"
+IPTABLES_STATUS_NUMERIC="yes"
+IPTABLES_STATUS_VERBOSE="no"
+IPTABLES_STATUS_LINENUMBERS="yes"
+IPTABLES_SYSCTL_LOAD_LIST=""
+
+# Load firewall configuration.
+[ -f "$IPTABLES_CONFIG" ] && . "$IPTABLES_CONFIG"
+
+# Netfilter modules
+NF_MODULES=($(lsmod | awk "/^${IPV}table_/ {print \$1}") ${IPV}_tables)
+NF_MODULES_COMMON=(x_tables nf_nat nf_conntrack) # Used by netfilter v4 and v6
+
+# Get active tables
+NF_TABLES=$(cat "$PROC_IPTABLES_NAMES" 2>/dev/null)
+
+
+rmmod_r() {
+    # Unload module with all referring modules.
+    # At first all referring modules will be unloaded, then the module itself.
+    local mod=$1
+    local ret=0
+    local ref=
+
+    # Get referring modules.
+    # New modutils have another output format.
+    [ $NEW_MODUTILS = 1 ] \
+	&& ref=$(lsmod | awk "/^${mod}/ { print \$4; }" | tr ',' ' ') \
+	|| ref=$(lsmod | grep ^${mod} | cut -d "[" -s -f 2 | cut -d "]" -s -f 1)
+
+    # recursive call for all referring modules
+    for i in $ref; do
+	rmmod_r $i
+	let ret+=$?;
+    done
+
+    # Unload module.
+    # The extra test is for 2.6: The module might have autocleaned,
+    # after all referring modules are unloaded.
+    if grep -q "^${mod}" /proc/modules ; then
+	modprobe -r $mod > /dev/null 2>&1
+	res=$?
+	[ $res -eq 0 ] || echo -n " $mod"
+	let ret+=$res;
+    fi
+
+    return $ret
+}
+
+flush_n_delete() {
+    # Flush firewall rules and delete chains.
+    [ ! -e "$PROC_IPTABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    [ -z "$NF_TABLES" ] && return 1
+
+    echo -n $"${IPTABLES}: Flushing firewall rules: "
+    ret=0
+    # For all tables
+    for i in $NF_TABLES; do
+        # Flush firewall rules.
+	$IPTABLES -t $i -F;
+	let ret+=$?;
+
+        # Delete firewall chains.
+	$IPTABLES -t $i -X;
+	let ret+=$?;
+
+	# Set counter to zero.
+	$IPTABLES -t $i -Z;
+	let ret+=$?;
+    done
+
+    [ $ret -eq 0 ] && success || failure
+    echo
+    return $ret
+}
+
+set_policy() {
+    # Set policy for configured tables.
+    policy=$1
+
+    # Check if iptable module is loaded
+    [ ! -e "$PROC_IPTABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    tables=$(cat "$PROC_IPTABLES_NAMES" 2>/dev/null)
+    [ -z "$tables" ] && return 1
+
+    echo -n $"${IPTABLES}: Setting chains to policy $policy: "
+    ret=0
+    for i in $tables; do
+	echo -n "$i "
+	case "$i" in
+	    raw)
+		$IPTABLES -t raw -P PREROUTING $policy \
+		    && $IPTABLES -t raw -P OUTPUT $policy \
+		    || let ret+=1
+		;;
+	    filter)
+                $IPTABLES -t filter -P INPUT $policy \
+		    && $IPTABLES -t filter -P OUTPUT $policy \
+		    && $IPTABLES -t filter -P FORWARD $policy \
+		    || let ret+=1
+		;;
+	    nat)
+		$IPTABLES -t nat -P PREROUTING $policy \
+		    && $IPTABLES -t nat -P POSTROUTING $policy \
+		    && $IPTABLES -t nat -P OUTPUT $policy \
+		    || let ret+=1
+		;;
+	    mangle)
+	        $IPTABLES -t mangle -P PREROUTING $policy \
+		    && $IPTABLES -t mangle -P POSTROUTING $policy \
+		    && $IPTABLES -t mangle -P INPUT $policy \
+		    && $IPTABLES -t mangle -P OUTPUT $policy \
+		    && $IPTABLES -t mangle -P FORWARD $policy \
+		    || let ret+=1
+		;;
+	    *)
+	        let ret+=1
+		;;
+        esac
+    done
+
+    [ $ret -eq 0 ] && success || failure
+    echo
+    return $ret
+}
+
+load_sysctl() {
+    # load matched sysctl values
+    if [ -n "$IPTABLES_SYSCTL_LOAD_LIST" ]; then
+        echo -n $"Loading sysctl settings: "
+        ret=0
+        for item in $IPTABLES_SYSCTL_LOAD_LIST; do
+            fgrep $item /etc/sysctl.conf | sysctl -p - >/dev/null
+            let ret+=$?;
+        done
+        [ $ret -eq 0 ] && success || failure
+        echo
+    fi
+    return $ret
+}
+
+start() {
+    # Do not start if there is no config file.
+    [ ! -f "$IPTABLES_DATA" ] && return 6
+
+    # check if ipv6 module load is deactivated
+    if [ "${_IPV}" = "ipv6" ] \
+	&& grep -qIsE "^install[[:space:]]+${_IPV}[[:space:]]+/bin/(true|false)" /etc/modprobe.conf /etc/modprobe.d/* ; then
+	echo $"${IPTABLES}: ${_IPV} is disabled."
+	return 150
+    fi
+
+    echo -n $"${IPTABLES}: Applying firewall rules: "
+
+    OPT=
+    [ "x$IPTABLES_SAVE_COUNTER" = "xyes" ] && OPT="-c"
+
+    $IPTABLES-restore $OPT $IPTABLES_DATA
+    if [ $? -eq 0 ]; then
+	success; echo
+    else
+	failure; echo;
+	if [ -f "$IPTABLES_FALLBACK_DATA" ]; then
+	    echo -n $"${IPTABLES}: Applying firewall fallback rules: "
+	    $IPTABLES-restore $OPT $IPTABLES_FALLBACK_DATA
+	    if [ $? -eq 0 ]; then
+		success; echo
+	    else
+		failure; echo; return 1
+	    fi
+	else
+	    return 1
+	fi
+    fi
+
+    # Load additional modules (helpers)
+    if [ -n "$IPTABLES_MODULES" ]; then
+	echo -n $"${IPTABLES}: Loading additional modules: "
+	ret=0
+	for mod in $IPTABLES_MODULES; do
+	    echo -n "$mod "
+	    modprobe $mod > /dev/null 2>&1
+	    let ret+=$?;
+	done
+	[ $ret -eq 0 ] && success || failure
+	echo
+    fi
+
+    # Load sysctl settings
+    load_sysctl
+
+    touch $VAR_SUBSYS_IPTABLES
+    return $ret
+}
+
+stop() {
+    # Do not stop if iptables module is not loaded.
+    [ ! -e "$PROC_IPTABLES_NAMES" ] && return 0
+
+    # Set default chain policy to ACCEPT, in order to not break shutdown
+    # on systems where the default policy is DROP and root device is
+    # network-based (i.e.: iSCSI, NFS)
+    set_policy ACCEPT
+    # And then, flush the rules and delete chains
+    flush_n_delete
+
+    if [ "x$IPTABLES_MODULES_UNLOAD" = "xyes" ]; then
+	echo -n $"${IPTABLES}: Unloading modules: "
+	ret=0
+	for mod in ${NF_MODULES[*]}; do
+	    rmmod_r $mod
+	    let ret+=$?;
+	done
+	# try to unload remaining netfilter modules used by ipv4 and ipv6
+	# netfilter
+	for mod in ${NF_MODULES_COMMON[*]}; do
+	    rmmod_r $mod >/dev/null
+	done
+	[ $ret -eq 0 ] && success || failure
+	echo
+    fi
+
+    rm -f $VAR_SUBSYS_IPTABLES
+    return $ret
+}
+
+save() {
+    # Check if iptable module is loaded
+    [ ! -e "$PROC_IPTABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    [ -z "$NF_TABLES" ] && return 6
+
+    echo -n $"${IPTABLES}: Saving firewall rules to $IPTABLES_DATA: "
+
+    OPT=
+    [ "x$IPTABLES_SAVE_COUNTER" = "xyes" ] && OPT="-c"
+
+    ret=0
+    TMP_FILE=$(/bin/mktemp -q $IPTABLES_DATA.XXXXXX) \
+	&& chmod 600 "$TMP_FILE" \
+	&& $IPTABLES-save $OPT > $TMP_FILE 2>/dev/null \
+	&& size=$(stat -c '%s' $TMP_FILE) && [ $size -gt 0 ] \
+	|| ret=1
+    if [ $ret -eq 0 ]; then
+	if [ -e $IPTABLES_DATA ]; then
+	    cp -f $IPTABLES_DATA $IPTABLES_DATA.save \
+		&& chmod 600 $IPTABLES_DATA.save \
+		&& restorecon $IPTABLES_DATA.save \
+		|| ret=1
+	fi
+	if [ $ret -eq 0 ]; then
+	    mv -f $TMP_FILE $IPTABLES_DATA \
+		&& chmod 600 $IPTABLES_DATA \
+		&& restorecon $IPTABLES_DATA \
+	        || ret=1
+	fi
+    fi
+    rm -f $TMP_FILE
+    [ $ret -eq 0 ] && success || failure
+    echo
+    return $ret
+}
+
+status() {
+    if [ ! -f "$VAR_SUBSYS_IPTABLES" -a -z "$NF_TABLES" ]; then
+	echo $"${IPTABLES}: Firewall is not running."
+	return 3
+    fi
+
+    # Do not print status if lockfile is missing and iptables modules are not
+    # loaded.
+    # Check if iptable modules are loaded
+    if [ ! -e "$PROC_IPTABLES_NAMES" ]; then
+	echo $"${IPTABLES}: Firewall modules are not loaded."
+	return 3
+    fi
+
+    # Check if firewall is configured (has tables)
+    if [ -z "$NF_TABLES" ]; then
+	echo $"${IPTABLES}: Firewall is not configured. "
+	return 3
+    fi
+
+    NUM=
+    [ "x$IPTABLES_STATUS_NUMERIC" = "xyes" ] && NUM="-n"
+    VERBOSE=
+    [ "x$IPTABLES_STATUS_VERBOSE" = "xyes" ] && VERBOSE="--verbose"
+    COUNT=
+    [ "x$IPTABLES_STATUS_LINENUMBERS" = "xyes" ] && COUNT="--line-numbers"
+
+    for table in $NF_TABLES; do
+	echo $"Table: $table"
+	$IPTABLES -t $table --list $NUM $VERBOSE $COUNT && echo
+    done
+
+    return 0
+}
+
+reload() {
+    # Do not reload if there is no config file.
+    [ ! -f "$IPTABLES_DATA" ] && return 6
+
+    # check if ipv6 module load is deactivated
+    if [ "${_IPV}" = "ipv6" ] \
+	&& grep -qIsE "^install[[:space:]]+${_IPV}[[:space:]]+/bin/(true|false)" /etc/modprobe.conf /etc/modprobe.d/* ; then
+	echo $"${IPTABLES}: ${_IPV} is disabled."
+	return 150
+    fi
+
+    echo -n $"${IPTABLES}: Trying to reload firewall rules: "
+
+    OPT=
+    [ "x$IPTABLES_SAVE_COUNTER" = "xyes" ] && OPT="-c"
+
+    $IPTABLES-restore $OPT $IPTABLES_DATA
+    if [ $? -eq 0 ]; then
+	success; echo
+    else
+	failure; echo; echo "Firewall rules are not changed."; return 1
+    fi
+
+    # Load additional modules (helpers)
+    if [ -n "$IPTABLES_MODULES" ]; then
+	echo -n $"${IPTABLES}: Loading additional modules: "
+	ret=0
+	for mod in $IPTABLES_MODULES; do
+	    echo -n "$mod "
+	    modprobe $mod > /dev/null 2>&1
+	    let ret+=$?;
+	done
+	[ $ret -eq 0 ] && success || failure
+	echo
+    fi
+
+    # Load sysctl settings
+    load_sysctl
+
+    return $ret
+}
+
+restart() {
+    [ "x$IPTABLES_SAVE_ON_RESTART" = "xyes" ] && save
+    stop
+    start
+}
+
+
+case "$1" in
+    start)
+	[ -f "$VAR_SUBSYS_IPTABLES" ] && exit 0
+	start
+	RETVAL=$?
+	;;
+    stop)
+	[ "x$IPTABLES_SAVE_ON_STOP" = "xyes" ] && save
+	stop
+	RETVAL=$?
+	;;
+    restart|force-reload)
+	restart
+	RETVAL=$?
+	;;
+    reload)
+	[ -e "$VAR_SUBSYS_IPTABLES" ] && reload
+	RETVAL=$?
+	;;
+    condrestart|try-restart)
+	[ ! -e "$VAR_SUBSYS_IPTABLES" ] && exit 0
+	restart
+	RETVAL=$?
+	;;
+    status)
+	status
+	RETVAL=$?
+	;;
+    panic)
+	set_policy DROP
+	RETVAL=$?
+        ;;
+    save)
+	save
+	RETVAL=$?
+	;;
+    *)
+	echo $"Usage: ${IPTABLES} {start|stop|reload|restart|condrestart|status|panic|save}"
+	RETVAL=2
+	;;
+esac
+
+exit $RETVAL
-- 
1.9.1


