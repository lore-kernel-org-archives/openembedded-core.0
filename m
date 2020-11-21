Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1440.1605927338072705497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 18:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=CjBgMUri;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 14726223FD;
	Sat, 21 Nov 2020 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605927337;
	bh=Igg4kx0fJVEkIpe0WrY2HEWG6ZnJ0ugUxDPCMAFfHqU=;
	h=From:To:Cc:Subject:Date:From;
	b=CjBgMUriCQJaXJI4+hWJ4SpjUUm2Yxdl8M8QJRzu5QQmaiNCmL5VHYaaBy/P2NEP8
	 r/oZ11WcgBLquwY366vrd96j5YaJUy98rkMW8e+fG4ijD8vgblNdnfviIHwRVrw7Lk
	 8LDz39D+z72Com4CHZhPNyUKfbWb79goavCfovLc=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] collectd: make all plugins optional
Date: Sat, 21 Nov 2020 02:55:31 +0000
Message-Id: <20201121025531.20691-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Plugins pull in unnecesary library dependencies to the target.
Make sure that user selects only the required plugins rather
than all plugins.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../collectd/collectd_5.12.0.bb               | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index f84a91adf1..05f633a397 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -51,6 +51,144 @@ PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasma
 PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
 PACKAGECONFIG[rrdtool] = "--enable-rrdtool,--disable-rrdtool,rrdtool"
 PACKAGECONFIG[rrdcached] = "--enable-rrdcached,--disable-rrdcached,rrdcached"
+PACKAGECONFIG[aggregation] = "--enable-aggregation,--disable-aggregation"
+PACKAGECONFIG[apache] = "--enable-apache,--disable-apache"
+PACKAGECONFIG[apcups] = "--enable-apcups,--disable-apcups"
+PACKAGECONFIG[apple_sensors] = "--enable-apple_sensors,--disable-apple_sensors"
+PACKAGECONFIG[aquaero] = "--enable-aquaero,--disable-aquaero"
+PACKAGECONFIG[ascent] = "--enable-ascent,--disable-ascent"
+PACKAGECONFIG[barometer] = "--enable-barometer,--disable-barometer"
+PACKAGECONFIG[battery] = "--enable-battery,--disable-battery"
+PACKAGECONFIG[bind] = "--enable-bind,--disable-bind"
+PACKAGECONFIG[ceph] = "--enable-ceph,--disable-ceph"
+PACKAGECONFIG[cgroups] = "--enable-cgroups,--disable-cgroups"
+PACKAGECONFIG[chrony] = "--enable-chrony,--disable-chrony"
+PACKAGECONFIG[conntrack] = "--enable-conntrack,--disable-conntrack"
+PACKAGECONFIG[contextswitch] = "--enable-contextswitch,--disable-contextswitch"
+PACKAGECONFIG[cpu] = "--enable-cpu,--disable-cpu"
+PACKAGECONFIG[cpufreq] = "--enable-cpufreq,--disable-cpufreq"
+PACKAGECONFIG[cpusleep] = "--enable-cpusleep,--disable-cpusleep"
+PACKAGECONFIG[csv] = "--enable-csv,--disable-csv"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl"
+PACKAGECONFIG[curl_json] = "--enable-curl_json,--disable-curl_json"
+PACKAGECONFIG[curl_xml] = "--enable-curl_xml,--disable-curl_xml"
+PACKAGECONFIG[df] = "--enable-df,--disable-df"
+PACKAGECONFIG[disk] = "--enable-disk,--disable-disk"
+PACKAGECONFIG[dns] = "--enable-dns,--disable-dns"
+PACKAGECONFIG[dpdkevents] = "--enable-dpdkevents,--disable-dpdkevents"
+PACKAGECONFIG[dpdkstat] = "--enable-dpdkstat,--disable-dpdkstat"
+PACKAGECONFIG[drbd] = "--enable-drbd,--disable-drbd"
+PACKAGECONFIG[email] = "--enable-email,--disable-email"
+PACKAGECONFIG[entropy] = "--enable-entropy,--disable-entropy"
+PACKAGECONFIG[ethstat] = "--enable-ethstat,--disable-ethstat"
+PACKAGECONFIG[exec] = "--enable-exec,--disable-exec"
+PACKAGECONFIG[fhcount] = "--enable-fhcount,--disable-fhcount"
+PACKAGECONFIG[filecount] = "--enable-filecount,--disable-filecount"
+PACKAGECONFIG[fscache] = "--enable-fscache,--disable-fscache"
+PACKAGECONFIG[gmond] = "--enable-gmond,--disable-gmond"
+PACKAGECONFIG[gps] = "--enable-gps,--disable-gps"
+PACKAGECONFIG[grpc] = "--enable-grpc,--disable-grpc"
+PACKAGECONFIG[hddtemp] = "--enable-hddtemp,--disable-hddtemp"
+PACKAGECONFIG[hugepages] = "--enable-hugepages,--disable-hugepages"
+PACKAGECONFIG[intel_pmu] = "--enable-intel_pmu,--disable-intel_pmu"
+PACKAGECONFIG[intel_rdt] = "--enable-intel_rdt,--disable-intel_rdt"
+PACKAGECONFIG[interface] = "--enable-interface,--disable-interface"
+PACKAGECONFIG[ipc] = "--enable-ipc,--disable-ipc"
+PACKAGECONFIG[ipmi] = "--enable-ipmi,--disable-ipmi"
+PACKAGECONFIG[ipvs] = "--enable-ipvs,--disable-ipvs"
+PACKAGECONFIG[irq] = "--enable-irq,--disable-irq"
+PACKAGECONFIG[load] = "--enable-load,--disable-load"
+PACKAGECONFIG[log_logstash] = "--enable-log_logstash,--disable-log_logstash"
+PACKAGECONFIG[logfile] = "--enable-logfile,--disable-logfile"
+PACKAGECONFIG[lpar] = "--enable-lpar,--disable-lpar"
+PACKAGECONFIG[lua] = "--enable-lua,--disable-lua"
+PACKAGECONFIG[madwifi] = "--enable-madwifi,--disable-madwifi"
+PACKAGECONFIG[match_empty_counter] = "--enable-match_empty_counter,--disable-match_empty_counter"
+PACKAGECONFIG[match_hashed] = "--enable-match_hashed,--disable-match_hashed"
+PACKAGECONFIG[match_regex] = "--enable-match_regex,--disable-match_regex"
+PACKAGECONFIG[match_timediff] = "--enable-match_timediff,--disable-match_timediff"
+PACKAGECONFIG[match_value] = "--enable-match_value,--disable-match_value"
+PACKAGECONFIG[mbmon] = "--enable-mbmon,--disable-mbmon"
+PACKAGECONFIG[mcelog] = "--enable-mcelog,--disable-mcelog"
+PACKAGECONFIG[md] = "--enable-md,--disable-md"
+PACKAGECONFIG[memcachec] = "--enable-memcachec,--disable-memcachec"
+PACKAGECONFIG[memcached] = "--enable-memcached,--disable-memcached"
+PACKAGECONFIG[memory] = "--enable-memory,--disable-memory"
+PACKAGECONFIG[mic] = "--enable-mic,--disable-mic"
+PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt"
+PACKAGECONFIG[multimeter] = "--enable-multimeter,--disable-multimeter"
+PACKAGECONFIG[netapp] = "--enable-netapp,--disable-netapp"
+PACKAGECONFIG[netlink] = "--enable-netlink,--disable-netlink"
+PACKAGECONFIG[network] = "--enable-network,--disable-network"
+PACKAGECONFIG[nfs] = "--enable-nfs,--disable-nfs"
+PACKAGECONFIG[nginx] = "--enable-nginx,--disable-nginx"
+PACKAGECONFIG[notify_desktop] = "--enable-notify_desktop,--disable-notify_desktop"
+PACKAGECONFIG[notify_email] = "--enable-notify_email,--disable-notify_email"
+PACKAGECONFIG[notify_nagios] = "--enable-notify_nagios,--disable-notify_nagios"
+PACKAGECONFIG[ntpd] = "--enable-ntpd,--disable-ntpd"
+PACKAGECONFIG[numa] = "--enable-numa,--disable-numa"
+PACKAGECONFIG[nut] = "--enable-nut,--disable-nut"
+PACKAGECONFIG[olsrd] = "--enable-olsrd,--disable-olsrd"
+PACKAGECONFIG[onewire] = "--enable-onewire,--disable-onewire"
+PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn"
+PACKAGECONFIG[oracle] = "--enable-oracle,--disable-oracle"
+PACKAGECONFIG[ovs_events] = "--enable-ovs_events,--disable-ovs_events"
+PACKAGECONFIG[ovs_stats] = "--enable-ovs_stats,--disable-ovs_stats"
+PACKAGECONFIG[perl] = "--enable-perl,--disable-perl"
+PACKAGECONFIG[pf] = "--enable-pf,--disable-pf"
+PACKAGECONFIG[ping] = "--enable-ping,--disable-ping"
+PACKAGECONFIG[powerdns] = "--enable-powerdns,--disable-powerdns"
+PACKAGECONFIG[processes] = "--enable-processes,--disable-processes"
+PACKAGECONFIG[protocols] = "--enable-protocols,--disable-protocols"
+PACKAGECONFIG[python] = "--enable-python,--disable-python"
+PACKAGECONFIG[redis] = "--enable-redis,--disable-redis"
+PACKAGECONFIG[routeros] = "--enable-routeros,--disable-routeros"
+PACKAGECONFIG[serial] = "--enable-serial,--disable-serial"
+PACKAGECONFIG[sigrok] = "--enable-sigrok,--disable-sigrok"
+PACKAGECONFIG[smart] = "--enable-smart,--disable-smart"
+PACKAGECONFIG[snmp_agent] = "--enable-snmp_agent,--disable-snmp_agent"
+PACKAGECONFIG[statsd] = "--enable-statsd,--disable-statsd"
+PACKAGECONFIG[swap] = "--enable-swap,--disable-swap"
+PACKAGECONFIG[synproxy] = "--enable-synproxy,--disable-synproxy"
+PACKAGECONFIG[syslog] = "--enable-syslog,--disable-syslog"
+PACKAGECONFIG[table] = "--enable-table,--disable-table"
+PACKAGECONFIG[tail] = "--enable-tail,--disable-tail"
+PACKAGECONFIG[tail_csv] = "--enable-tail_csv,--disable-tail_csv"
+PACKAGECONFIG[tape] = "--enable-tape,--disable-tape"
+PACKAGECONFIG[target_notification] = "--enable-target_notification,--disable-target_notification"
+PACKAGECONFIG[target_replace] = "--enable-target_replace,--disable-target_replace"
+PACKAGECONFIG[target_scale] = "--enable-target_scale,--disable-target_scale"
+PACKAGECONFIG[target_set] = "--enable-target_set,--disable-target_set"
+PACKAGECONFIG[target_v5upgrade] = "--enable-target_v5upgrade,--disable-target_v5upgrade"
+PACKAGECONFIG[tcpconns] = "--enable-tcpconns,--disable-tcpconns"
+PACKAGECONFIG[teamspeak2] = "--enable-teamspeak2,--disable-teamspeak2"
+PACKAGECONFIG[ted] = "--enable-ted,--disable-ted"
+PACKAGECONFIG[thermal] = "--enable-thermal,--disable-thermal"
+PACKAGECONFIG[threshold] = "--enable-threshold,--disable-threshold"
+PACKAGECONFIG[tokyotyrant] = "--enable-tokyotyrant,--disable-tokyotyrant"
+PACKAGECONFIG[turbostat] = "--enable-turbostat,--disable-turbostat"
+PACKAGECONFIG[unixsock] = "--enable-unixsock,--disable-unixsock"
+PACKAGECONFIG[uptime] = "--enable-uptime,--disable-uptime"
+PACKAGECONFIG[users] = "--enable-users,--disable-users"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid"
+PACKAGECONFIG[varnish] = "--enable-varnish,--disable-varnish"
+PACKAGECONFIG[vmem] = "--enable-vmem,--disable-vmem"
+PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
+PACKAGECONFIG[wireless] = "--enable-wireless,--disable-wireless"
+PACKAGECONFIG[write_graphite] = "--enable-write_graphite,--disable-write_graphite"
+PACKAGECONFIG[write_http] = "--enable-write_http,--disable-write_http"
+PACKAGECONFIG[write_kafka] = "--enable-write_kafka,--disable-write_kafka"
+PACKAGECONFIG[write_log] = "--enable-write_log,--disable-write_log"
+PACKAGECONFIG[write_mongodb] = "--enable-write_mongodb,--disable-write_mongodb"
+PACKAGECONFIG[write_redis] = "--enable-write_redis,--disable-write_redis"
+PACKAGECONFIG[write_riemann] = "--enable-write_riemann,--disable-write_riemann"
+PACKAGECONFIG[write_sensu] = "--enable-write_sensu,--disable-write_sensu"
+PACKAGECONFIG[write_tsdb] = "--enable-write_tsdb,--disable-write_tsdb"
+PACKAGECONFIG[xencpu] = "--enable-xencpu,--disable-xencpu"
+PACKAGECONFIG[xmms] = "--enable-xmms,--disable-xmms"
+PACKAGECONFIG[zfs_arc] = "--enable-zfs_arc,--disable-zfs_arc"
+PACKAGECONFIG[zone] = "--enable-zone,--disable-zone"
+PACKAGECONFIG[zookeeper] = "--enable-zookeeper,--disable-zookeeper"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
2.17.1

