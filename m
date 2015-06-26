Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5410A73779
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:51:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97784181"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 16:55:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q8ngrS011474
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:49:43 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 16:51:20 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 16:51:13 +0800
Message-ID: <1435308673-1800-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] iptables: add systemd support.
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
X-List-Received-Date: Fri, 26 Jun 2015 08:51:28 -0000
Content-Type: text/plain

Add systemd service file iptables.service and ip6tables.service,
also,add configuration file.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../iptables/iptables/ip6tables.data               |  13 +
 .../iptables/iptables/ip6tables.default            |  48 +++
 .../iptables/iptables/ip6tables.init               | 369 +++++++++++++++++++++
 .../iptables/iptables/ip6tables.service            |  17 +
 .../iptables/iptables/iptables.data                |  13 +
 .../iptables/iptables/iptables.default             |  48 +++
 .../iptables/iptables/iptables.init                | 369 +++++++++++++++++++++
 .../iptables/iptables/iptables.service             |  17 +
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |  35 +-
 9 files changed, 928 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.data
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.default
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.init
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.service
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.data
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.default
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.init
 create mode 100644 meta/recipes-extended/iptables/iptables/iptables.service

diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.data b/meta/recipes-extended/iptables/iptables/ip6tables.data
new file mode 100644
index 0000000..0280a80
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.data
@@ -0,0 +1,13 @@
+# Firewall configuration written by system-config-firewall
+# Manual customization of this file is not recommended.
+*filter
+:INPUT ACCEPT [0:0]
+:FORWARD ACCEPT [0:0]
+:OUTPUT ACCEPT [0:0]
+-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
+-A INPUT -p ipv6-icmp -j ACCEPT
+-A INPUT -i lo -j ACCEPT
+-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
+-A INPUT -j REJECT --reject-with icmp6-adm-prohibited
+-A FORWARD -j REJECT --reject-with icmp6-adm-prohibited
+COMMIT
diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.default b/meta/recipes-extended/iptables/iptables/ip6tables.default
new file mode 100644
index 0000000..d385911
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.default
@@ -0,0 +1,48 @@
+# Load additional ip6tables modules (nat helpers)
+#   Default: -none-
+# Space separated list of nat helpers (e.g. 'ip_nat_ftp ip_nat_irc'), which
+# are loaded after the firewall rules are applied. Options for the helpers are
+# stored in /etc/modprobe.conf.
+IP6TABLES_MODULES=""
+
+# Unload modules on restart and stop
+#   Value: yes|no,  default: yes
+# This option has to be 'yes' to get to a sane state for a firewall
+# restart or stop. Only set to 'no' if there are problems unloading netfilter
+# modules.
+IP6TABLES_MODULES_UNLOAD="yes"
+
+# Save current firewall rules on stop.
+#   Value: yes|no,  default: no
+# Saves all firewall rules to /etc/sysconfig/ip6tables if firewall gets stopped
+# (e.g. on system shutdown).
+IP6TABLES_SAVE_ON_STOP="no"
+
+# Save current firewall rules on restart.
+#   Value: yes|no,  default: no
+# Saves all firewall rules to /etc/sysconfig/ip6tables if firewall gets
+# restarted.
+IP6TABLES_SAVE_ON_RESTART="no"
+
+# Save (and restore) rule and chain counter.
+#   Value: yes|no,  default: no
+# Save counters for rules and chains to /etc/sysconfig/ip6tables if
+# 'service ip6tables save' is called or on stop or restart if SAVE_ON_STOP or
+# SAVE_ON_RESTART is enabled.
+IP6TABLES_SAVE_COUNTER="no"
+
+# Numeric status output
+#   Value: yes|no,  default: yes
+# Print IP addresses and port numbers in numeric format in the status output.
+IP6TABLES_STATUS_NUMERIC="yes"
+
+# Verbose status output
+#   Value: yes|no,  default: yes
+# Print info about the number of packets and bytes plus the "input-" and
+# "outputdevice" in the status output.
+IP6TABLES_STATUS_VERBOSE="no"
+
+# Status output with numbered lines
+#   Value: yes|no,  default: yes
+# Print a counter/number for every rule in the status output.
+IP6TABLES_STATUS_LINENUMBERS="yes"
diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.init b/meta/recipes-extended/iptables/iptables/ip6tables.init
new file mode 100644
index 0000000..8411c07
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.init
@@ -0,0 +1,369 @@
+#!/bin/sh
+#
+# ip6tables	Start ip6tables firewall
+#
+# chkconfig: 2345 08 92
+# description:	Starts, stops and saves ip6tables firewall
+#
+# config: /etc/iptables/ip6tables
+# config: /etc/default/ip6tables
+#
+### BEGIN INIT INFO
+# Provides: ip6tables
+# Required-Start:
+# Required-Stop:
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: start and stop ip6tables firewall
+# Description: Start, stop and save ip6tables firewall
+### END INIT INFO
+
+# Source function library.
+. /etc/init.d/functions
+
+IP6TABLES=ip6tables
+IP6TABLES_DATA=/etc/iptables/$IP6TABLES
+IP6TABLES_CONFIG=/etc/default/$IP6TABLES
+IPV=${IP6TABLES%tables} # ip for ipv4 | ip6 for ipv6
+[ "$IPV" = "ip" ] && _IPV="ipv4" || _IPV="ipv6"
+PROC_IP6TABLES_NAMES=/proc/net/${IPV}_tables_names
+VAR_SUBSYS_IP6TABLES=/var/lock/subsys/$IP6TABLES
+
+# only usable for root
+[ $EUID = 0 ] || exit 4
+
+if [ ! -x /usr/sbin/$IP6TABLES ]; then
+    echo -n $"${IP6TABLES}: /usr/sbin/$IP6TABLES does not exist."; warning; echo
+    exit 5
+fi
+
+# Old or new modutils
+/sbin/modprobe --version 2>&1 | grep -q module-init-tools \
+    && NEW_MODUTILS=1 \
+    || NEW_MODUTILS=0
+
+# Default firewall configuration:
+IP6TABLES_MODULES=""
+IP6TABLES_MODULES_UNLOAD="yes"
+IP6TABLES_SAVE_ON_STOP="no"
+IP6TABLES_SAVE_ON_RESTART="no"
+IP6TABLES_SAVE_COUNTER="no"
+IP6TABLES_STATUS_NUMERIC="yes"
+IP6TABLES_STATUS_VERBOSE="no"
+IP6TABLES_STATUS_LINENUMBERS="yes"
+
+# Load firewall configuration.
+[ -f "$IP6TABLES_CONFIG" ] && . "$IP6TABLES_CONFIG"
+
+# Netfilter modules
+NF_MODULES=($(lsmod | awk "/^${IPV}table_/ {print \$1}") ${IPV}_tables)
+NF_MODULES_COMMON=(x_tables nf_nat nf_conntrack) # Used by netfilter v4 and v6
+
+# Get active tables
+NF_TABLES=$(cat "$PROC_IP6TABLES_NAMES" 2>/dev/null)
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
+    [ ! -e "$PROC_IP6TABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    [ -z "$NF_TABLES" ] && return 1
+
+    echo -n $"${IP6TABLES}: Flushing firewall rules: "
+    ret=0
+    # For all tables
+    for i in $NF_TABLES; do
+        # Flush firewall rules.
+	$IP6TABLES -t $i -F;
+	let ret+=$?;
+
+        # Delete firewall chains.
+	$IP6TABLES -t $i -X;
+	let ret+=$?;
+
+	# Set counter to zero.
+	$IP6TABLES -t $i -Z;
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
+    [ ! -e "$PROC_IP6TABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    tables=$(cat "$PROC_IP6TABLES_NAMES" 2>/dev/null)
+    [ -z "$tables" ] && return 1
+
+    echo -n $"${IP6TABLES}: Setting chains to policy $policy: "
+    ret=0
+    for i in $tables; do
+	echo -n "$i "
+	case "$i" in
+	    raw)
+		$IP6TABLES -t raw -P PREROUTING $policy \
+		    && $IP6TABLES -t raw -P OUTPUT $policy \
+		    || let ret+=1
+		;;
+	    filter)
+                $IP6TABLES -t filter -P INPUT $policy \
+		    && $IP6TABLES -t filter -P OUTPUT $policy \
+		    && $IP6TABLES -t filter -P FORWARD $policy \
+		    || let ret+=1
+		;;
+	    nat)
+		$IP6TABLES -t nat -P PREROUTING $policy \
+		    && $IP6TABLES -t nat -P POSTROUTING $policy \
+		    && $IP6TABLES -t nat -P OUTPUT $policy \
+		    || let ret+=1
+		;;
+	    mangle)
+	        $IP6TABLES -t mangle -P PREROUTING $policy \
+		    && $IP6TABLES -t mangle -P POSTROUTING $policy \
+		    && $IP6TABLES -t mangle -P INPUT $policy \
+		    && $IP6TABLES -t mangle -P OUTPUT $policy \
+		    && $IP6TABLES -t mangle -P FORWARD $policy \
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
+start() {
+    # Do not start if there is no config file.
+    [ ! -f "$IP6TABLES_DATA" ] && return 6
+
+    # check if ipv6 module load is deactivated
+    if [ "${_IPV}" = "ipv6" ] \
+	&& grep -qIsE "^install[[:space:]]+${_IPV}[[:space:]]+/bin/(true|false)" /etc/modprobe.conf /etc/modprobe.d/* ; then
+	echo $"${IP6TABLES}: ${_IPV} is disabled."
+	return 150
+    fi
+
+    echo -n $"${IP6TABLES}: Applying firewall rules: "
+
+    OPT=
+    [ "x$IP6TABLES_SAVE_COUNTER" = "xyes" ] && OPT="-c"
+
+    $IP6TABLES-restore $OPT $IP6TABLES_DATA
+    if [ $? -eq 0 ]; then
+	success; echo
+    else
+	failure; echo; return 1
+    fi
+    
+    # Load additional modules (helpers)
+    if [ -n "$IP6TABLES_MODULES" ]; then
+	echo -n $"${IP6TABLES}: Loading additional modules: "
+	ret=0
+	for mod in $IP6TABLES_MODULES; do
+	    echo -n "$mod "
+	    modprobe $mod > /dev/null 2>&1
+	    let ret+=$?;
+	done
+	[ $ret -eq 0 ] && success || failure
+	echo
+    fi
+    
+    touch $VAR_SUBSYS_IP6TABLES
+    return $ret
+}
+
+stop() {
+    # Do not stop if ip6tables module is not loaded.
+    [ ! -e "$PROC_IP6TABLES_NAMES" ] && return 0
+
+    flush_n_delete
+    set_policy ACCEPT
+    
+    if [ "x$IP6TABLES_MODULES_UNLOAD" = "xyes" ]; then
+	echo -n $"${IP6TABLES}: Unloading modules: "
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
+    rm -f $VAR_SUBSYS_IP6TABLES
+    return $ret
+}
+
+save() {
+    # Check if iptable module is loaded
+    [ ! -e "$PROC_IP6TABLES_NAMES" ] && return 0
+
+    # Check if firewall is configured (has tables)
+    [ -z "$NF_TABLES" ] && return 6
+
+    echo -n $"${IP6TABLES}: Saving firewall rules to $IP6TABLES_DATA: "
+
+    OPT=
+    [ "x$IP6TABLES_SAVE_COUNTER" = "xyes" ] && OPT="-c"
+
+    ret=0
+    TMP_FILE=$(/bin/mktemp -q $IP6TABLES_DATA.XXXXXX) \
+	&& chmod 600 "$TMP_FILE" \
+	&& $IP6TABLES-save $OPT > $TMP_FILE 2>/dev/null \
+	&& size=$(stat -c '%s' $TMP_FILE) && [ $size -gt 0 ] \
+	|| ret=1
+    if [ $ret -eq 0 ]; then
+	if [ -e $IP6TABLES_DATA ]; then
+	    cp -f $IP6TABLES_DATA $IP6TABLES_DATA.save \
+		&& chmod 600 $IP6TABLES_DATA.save \
+		&& restorecon $IP6TABLES_DATA.save \
+		|| ret=1
+	fi
+	if [ $ret -eq 0 ]; then
+	    mv -f $TMP_FILE $IP6TABLES_DATA \
+		&& chmod 600 $IP6TABLES_DATA \
+		&& restorecon $IP6TABLES_DATA \
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
+    if [ ! -f "$VAR_SUBSYS_IP6TABLES" -a -z "$NF_TABLES" ]; then
+	echo $"${IP6TABLES}: Firewall is not running."
+	return 3
+    fi
+
+    # Do not print status if lockfile is missing and ip6tables modules are not 
+    # loaded.
+    # Check if iptable modules are loaded
+    if [ ! -e "$PROC_IP6TABLES_NAMES" ]; then
+	echo $"${IP6TABLES}: Firewall modules are not loaded."
+	return 3
+    fi
+
+    # Check if firewall is configured (has tables)
+    if [ -z "$NF_TABLES" ]; then
+	echo $"${IP6TABLES}: Firewall is not configured. "
+	return 3
+    fi
+
+    NUM=
+    [ "x$IP6TABLES_STATUS_NUMERIC" = "xyes" ] && NUM="-n"
+    VERBOSE= 
+    [ "x$IP6TABLES_STATUS_VERBOSE" = "xyes" ] && VERBOSE="--verbose"
+    COUNT=
+    [ "x$IP6TABLES_STATUS_LINENUMBERS" = "xyes" ] && COUNT="--line-numbers"
+
+    for table in $NF_TABLES; do
+	echo $"Table: $table"
+	$IP6TABLES -t $table --list $NUM $VERBOSE $COUNT && echo
+    done
+
+    return 0
+}
+
+restart() {
+    [ "x$IP6TABLES_SAVE_ON_RESTART" = "xyes" ] && save
+    stop
+    start
+}
+
+
+case "$1" in
+    start)
+	[ -f "$VAR_SUBSYS_IP6TABLES" ] && exit 0
+	start
+	RETVAL=$?
+	;;
+    stop)
+	[ "x$IP6TABLES_SAVE_ON_STOP" = "xyes" ] && save
+	stop
+	RETVAL=$?
+	;;
+    restart|force-reload)
+	restart
+	RETVAL=$?
+	;;
+    reload)
+	# unimplemented
+	RETVAL=3
+	;;
+    condrestart|try-restart)
+	[ ! -e "$VAR_SUBSYS_IP6TABLES" ] && exit 0
+	restart
+	RETVAL=$?
+	;;
+    status)
+	status
+	RETVAL=$?
+	;;
+    panic)
+	flush_n_delete
+	set_policy DROP
+	RETVAL=$?
+        ;;
+    save)
+	save
+	RETVAL=$?
+	;;
+    *)
+	echo $"Usage: ${IP6TABLES} {start|stop|restart|condrestart|status|panic|save}"
+	RETVAL=2
+	;;
+esac
+
+exit $RETVAL
diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.service b/meta/recipes-extended/iptables/iptables/ip6tables.service
new file mode 100644
index 0000000..148a1b9
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=IPv6 firewall with ip6tables
+After=syslog.target
+ConditionPathExists=/etc/default/iptables
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/libexec/iptables/ip6tables.init start
+ExecStop=/usr/libexec/iptables/ip6tables.init stop
+Environment=BOOTUP=serial
+Environment=CONSOLETYPE=serial
+StandardOutput=syslog
+StandardError=syslog
+
+[Install]
+WantedBy=basic.target
diff --git a/meta/recipes-extended/iptables/iptables/iptables.data b/meta/recipes-extended/iptables/iptables/iptables.data
new file mode 100644
index 0000000..4ab84e5
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.data
@@ -0,0 +1,13 @@
+# Firewall configuration written by system-config-firewall
+# Manual customization of this file is not recommended.
+*filter
+:INPUT ACCEPT [0:0]
+:FORWARD ACCEPT [0:0]
+:OUTPUT ACCEPT [0:0]
+-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
+-A INPUT -p icmp -j ACCEPT
+-A INPUT -i lo -j ACCEPT
+-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
+-A INPUT -j REJECT --reject-with icmp-host-prohibited
+-A FORWARD -j REJECT --reject-with icmp-host-prohibited
+COMMIT
diff --git a/meta/recipes-extended/iptables/iptables/iptables.default b/meta/recipes-extended/iptables/iptables/iptables.default
new file mode 100644
index 0000000..d906dd5
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.default
@@ -0,0 +1,48 @@
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
diff --git a/meta/recipes-extended/iptables/iptables/iptables.init b/meta/recipes-extended/iptables/iptables/iptables.init
new file mode 100644
index 0000000..d0fd04d
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.init
@@ -0,0 +1,369 @@
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
+IPTABLES_DATA=/etc/iptables/$IPTABLES
+IPTABLES_CONFIG=/etc/default/${IPTABLES}
+IPV=${IPTABLES%tables} # ip for ipv4 | ip6 for ipv6
+[ "$IPV" = "ip" ] && _IPV="ipv4" || _IPV="ipv6"
+PROC_IPTABLES_NAMES=/proc/net/${IPV}_tables_names
+VAR_SUBSYS_IPTABLES=/var/lock/subsys/$IPTABLES
+
+# only usable for root
+[ $EUID = 0 ] || exit 4
+
+if [ ! -x /usr/sbin/$IPTABLES ]; then
+    echo -n $"${IPTABLES}: /usr/sbin/$IPTABLES does not exist."; warning; echo
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
+	failure; echo; return 1
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
+    touch $VAR_SUBSYS_IPTABLES
+    return $ret
+}
+
+stop() {
+    # Do not stop if iptables module is not loaded.
+    [ ! -e "$PROC_IPTABLES_NAMES" ] && return 0
+
+    flush_n_delete
+    set_policy ACCEPT
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
+	# unimplemented
+	RETVAL=3
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
+	flush_n_delete
+	set_policy DROP
+	RETVAL=$?
+        ;;
+    save)
+	save
+	RETVAL=$?
+	;;
+    *)
+	echo $"Usage: ${IPTABLES} {start|stop|restart|condrestart|status|panic|save}"
+	RETVAL=2
+	;;
+esac
+
+exit $RETVAL
diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
new file mode 100644
index 0000000..9745c71
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/iptables.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=IPv4 firewall with iptables
+After=syslog.target
+ConditionPathExists=/etc/default/iptables
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=/usr/libexec/iptables/iptables.init start
+ExecStop=/usr/libexec/iptables/iptables.init stop
+Environment=BOOTUP=serial
+Environment=CONSOLETYPE=serial
+StandardOutput=syslog
+StandardError=syslog
+
+[Install]
+WantedBy=basic.target
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index 31c017b..e237fbf 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -23,12 +23,20 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0001-fix-build-with-musl.patch \
+           file://iptables.service \
+           file://ip6tables.service \
+           file://iptables.init \
+           file://iptables.default \
+           file://iptables.data \
+           file://ip6tables.init \
+           file://ip6tables.default \
+           file://ip6tables.data \
           "
 
 SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
 SRC_URI[sha256sum] = "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
                "
@@ -45,3 +53,28 @@ do_configure_prepend() {
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -d ${D}${libexecdir}
+	install -m 0644 ${WORKDIR}/ip6tables.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_unitdir}/system/
+	install -m 755 ${WORKDIR}/iptables.init ${D}${libexecdir}/
+	install -m 755 ${WORKDIR}/ip6tables.init ${D}${libexecdir}/
+	sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
+                       ${D}${systemd_unitdir}/system/iptables.service
+	sed -i -e "s,/usr/libexec/iptables,${libexecdir},g" \
+                           ${D}${systemd_unitdir}/system/ip6tables.service
+	install -d ${D}/${sysconfdir}/init.d
+	install -d ${D}/${sysconfdir}/default
+	install -d ${D}/${sysconfdir}/iptables
+	install -m 755 ${WORKDIR}/iptables.init    ${D}${sysconfdir}/init.d/iptables
+	install -m 755 ${WORKDIR}/iptables.default ${D}${sysconfdir}/default/iptables
+	install -m 755 ${WORKDIR}/iptables.data    ${D}${sysconfdir}/iptables/iptables
+	install -m 755 ${WORKDIR}/ip6tables.init    ${D}${sysconfdir}/init.d/ip6tables
+	install -m 755 ${WORKDIR}/ip6tables.default ${D}${sysconfdir}/default/ip6tables
+	install -m 755 ${WORKDIR}/ip6tables.data    ${D}${sysconfdir}/iptables/ip6tables
+}
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "iptables.service ip6tables.service"
-- 
1.8.4.2


