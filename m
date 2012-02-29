Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2rmo-0004MN-Fz
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 23:14:14 +0100
Received: by yenm3 with SMTP id m3so1524436yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 14:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.4.71 as permitted sender) client-ip=10.60.4.71; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.4.71 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.4.71])
	by 10.60.4.71 with SMTP id i7mr811035oei.39.1330553144869 (num_hops =
	1); Wed, 29 Feb 2012 14:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GzQ3YBQGmC4dKp2SAqFGkd97aOXJS62+eLm0OEhufzI=;
	b=nBkEPnDn5/soktQGXWHCFuAEA0S/djBywLd6Dtsp28LZvd6ByeSyE/PKEmidf0XJ6X
	JigZjw5pYrmrf0rPyBm7zFQ52K9wE1UuPKcPfPCZwrcNnTPav0llXsX1Uy+ny+E7KdUL
	G6hOLhszUPNHIishT1whM3vRmjaCGb34srO6E=
MIME-Version: 1.0
Received: by 10.60.4.71 with SMTP id i7mr697384oei.39.1330553144836; Wed, 29
	Feb 2012 14:05:44 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Wed, 29 Feb 2012 14:05:44 -0800 (PST)
Date: Wed, 29 Feb 2012 14:05:44 -0800
Message-ID: <CAGDS+nk7a=X-zrjsv9RtuH-YzSLX=gAsqbtpVkF+tQ=saJQP1w@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: wpa-supplicant strangeness after pull
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
X-List-Received-Date: Wed, 29 Feb 2012 22:14:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm continuing to see failing builds or defective packages on package
rebuilds triggered by the recent change to sstate hash.

The wpa-supplicant package is a good example of the latter -- the
rebuild completes successfully but the resulting package is defective.
 There were no recent changes to the recipe, so this was clearly a
"just to be safe" rebuild based on sstate hash (correct me if I am
wrong!)

In particular /usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service
now contains:

Exec=/usr/usr/sbin/wpa_supplicant -u

rather than:

Exec=/usr/sbin/wpa_supplicant -u

Rebuilding the package after a -c cleansstate restores the expected result.

Is it "just me" or are others seeing this kind of breakage?

I'm beginning to suspect I ought to just do a clean build after every
pull in order to remain productive!

Steve


