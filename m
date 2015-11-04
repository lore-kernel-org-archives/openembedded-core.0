Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Nov 2015 16:20:03 UTC
Received: from mail15.tpgi.com.au (smtp-out15.tpgi.com.au [220.244.226.125])
	by mail.openembedded.org (Postfix) with ESMTP id CFFD175D22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:20:03 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Thu, 5 Nov 2015 03:04:38 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail15.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id tA4G4aqG010931
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Nov 2015 03:04:38 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.85)
	(envelope-from <openembedded-devel@urbanec.net>) id 1Zu0Y8-00032X-4h
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Nov 2015 03:04:36 +1100
To: openembedded-core@lists.openembedded.org
From: Peter Urbanec <openembedded-devel@urbanec.net>
Message-ID: <563A2C93.7060506@urbanec.net>
Date: Thu, 5 Nov 2015 03:04:35 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Using package specific DESCRIPTION with do_split_packages
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
X-List-Received-Date: Wed, 04 Nov 2015 16:20:08 -0000
Content-Type: multipart/alternative;
	boundary="------------000201070501080002000001"

--------------000201070501080002000001
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've been wrestling with do_split_packages and package_ipk trying to 
generate packages that have a customised DESCRIPTION override. I could 
not get it to work. Here is roughly what I tried:

--- mytest.bb start ---
SUMMARY = "Generic summary"
DESCRIPTION = "Generic description"
...
DESCRIPTION_mytest-plugin-item1 = "Description specific to item1"
DESCRIPTION_mytest-plugin-item2 = "Description specific to item2"
...
RDEPENDS_mytest-plugin-item1 = "python-requests"
...
python populate_packages_prepend() {
     mytest_plugindir = bb.data.expand('${libdir}/mytest/Plugins', d)
     do_split_packages(d, mytest_plugindir, 
'^(\w+/\w+)/[a-zA-Z0-9_]+.*$', 'mytest-plugin-%s', 
'${DESCRIPTION_mytest-plugin-%s}', recursive=True, match_path=True, 
prepend=True)
     do_split_packages(d, mytest_plugindir, '^(\w+/\w+)/.*\.py$', 
'mytest-plugin-%s-src', '%s (source files)', recursive=True, 
match_path=True, prepend=True)
}

--- mytest.bb end ---

The .ipk files generated using do_split_packages always have the generic 
description and summary, instead of using the package specific versions. 
I've tried a number of variants of the above, but without any luck.

In the end I ended up making the following changes. I have a feeling 
that this is not the right solution, but I'm at a loss as to a more 
appropriate way of doing what I want. Any suggestions?

diff --git a/meta/classes/package_ipk.bbclass 
b/meta/classes/package_ipk.bbclass
index dba6804..f7f61c7 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -138,9 +138,9 @@ python do_package_ipk () {
                          raise KeyError(f)
                  # Special behavior for description...
                  if 'DESCRIPTION' in fs:
-                    summary = localdata.getVar('SUMMARY', True) or 
localdata.getVar('DESCRIPTION', True) or "."
+                    summary = localdata.getVar('SUMMARY_' + pkgname, 
True) or localdata.getVar('SUMMARY', True) or 
localdata.getVar('DESCRIPTION_' + pkgname, True) or 
localdata.getVar('DESCRIPTION', True) or "."
                      ctrlfile.write('Description: %s\n' % summary)
-                    description = localdata.getVar('DESCRIPTION', True) 
or "."
+                    description = localdata.getVar('DESCRIPTION_' + 
pkgname, True) or localdata.getVar('DESCRIPTION', True) or "."
                      description = textwrap.dedent(description).strip()
                      if '\\n' in description:
                          # Manually indent


--------------000201070501080002000001
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font face="Droid Sans Mono">Hi,<br>
      <br>
      I've been wrestling with do_split_packages and package_ipk trying
      to generate packages that have a customised DESCRIPTION override.
      I could not get it to work. Here is roughly what I tried:<br>
      <br>
      --- mytest.bb start ---<br>
      SUMMARY = "Generic summary"<br>
      DESCRIPTION = "Generic description"<br>
      ...<br>
      DESCRIPTION_mytest-plugin-item1 = "Description specific to item1"<br>
      DESCRIPTION_mytest-plugin-item2 = "Description specific to item2"<br>
      ...<br>
      RDEPENDS_mytest-plugin-item1 = "python-requests"<br>
      ...<br>
      python populate_packages_prepend() {<br>
          mytest_plugindir = bb.data.expand('${libdir}/mytest/Plugins',
      d)<br>
          do_split_packages(d, mytest_plugindir,
      '^(\w+/\w+)/[a-zA-Z0-9_]+.*$', 'mytest-plugin-%s',
      '${DESCRIPTION_mytest-plugin-%s}', recursive=True,
      match_path=True, prepend=True)<br>
          do_split_packages(d, mytest_plugindir, '^(\w+/\w+)/.*\.py$',
      'mytest-plugin-%s-src', '%s (source files)', recursive=True,
      match_path=True, prepend=True)<br>
      }<br>
    </font><br>
    <font face="Droid Sans Mono"><font face="Droid Sans Mono">---
        mytest.bb end ---<br>
      </font><br>
      The .ipk files generated using do_split_packages always have the
      generic description and summary, instead of using the package
      specific versions. I've tried a number of variants of the above,
      but without any luck.<br>
      <br>
      In the end I ended up making the following changes. I have a
      feeling that this is not the right solution, but I'm at a loss as
      to a more appropriate way of doing what I want. Any suggestions?<br>
      <br>
      diff --git a/meta/classes/package_ipk.bbclass
      b/meta/classes/package_ipk.bbclass<br>
      index dba6804..f7f61c7 100644<br>
      --- a/meta/classes/package_ipk.bbclass<br>
      +++ b/meta/classes/package_ipk.bbclass<br>
      @@ -138,9 +138,9 @@ python do_package_ipk () {<br>
                               raise KeyError(f)<br>
                       # Special behavior for description...<br>
                       if 'DESCRIPTION' in fs:<br>
      -                    summary = localdata.getVar('SUMMARY', True)
      or localdata.getVar('DESCRIPTION', True) or "."<br>
      +                    summary = localdata.getVar('SUMMARY_' +
      pkgname, True) or localdata.getVar('SUMMARY', True) or
      localdata.getVar('DESCRIPTION_' + pkgname, True) or
      localdata.getVar('DESCRIPTION', True) or "."<br>
                           ctrlfile.write('Description: %s\n' % summary)<br>
      -                    description = localdata.getVar('DESCRIPTION',
      True) or "."<br>
      +                    description = localdata.getVar('DESCRIPTION_'
      + pkgname, True) or localdata.getVar('DESCRIPTION', True) or "."<br>
                           description =
      textwrap.dedent(description).strip()<br>
                           if '\\n' in description:<br>
                               # Manually indent<br>
      <br>
    </font>
  </body>
</html>

--------------000201070501080002000001--
