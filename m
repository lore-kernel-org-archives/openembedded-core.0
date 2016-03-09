Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id BA6A66010B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 10:02:01 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id ig19so74524883igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 02:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:organization:mime-version
	:content-transfer-encoding;
	bh=zl6oKhQYfrd+4hOnniPfPmxZV5KjMKb83573e7wytU0=;
	b=PBEbFLP4XlQBF3eVGlXp4Usv7ol9yVEtoEGv0I4oNFhYN3UBiHtaB0bao8Mrc41c+D
	AtSG8300vG2WzQu7aK7ZtgCIJw+iByFhSBPItJSgGNm2TEWMqboz29kajgldVKHSwUHK
	LXh1XwpRC3T28XLG32o8UCNgvJzsQO/T6l5wyDpLAz1LK2cLbzLYU4mmaK5TODYWs1B+
	+JbRjrI9MNt7u1oaaDQ5oy8mwqbRd2KT58WL6c9vn7fV+p4YN2tQoULzs0LIENfTzazm
	qfmfX0AZAv5IROmKJpxSgXPHuNj7zfGPrhTKIKp5F8pNsrQ6NNYOKgSwv8KnMkoRd3s/
	Ss1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:mime-version:content-transfer-encoding;
	bh=zl6oKhQYfrd+4hOnniPfPmxZV5KjMKb83573e7wytU0=;
	b=OoK9gcjZdoMZEzDRCNDOcQp29BrdP7rfttrZPipKkeKJO58KlWruYC2XU1eWrtT4TX
	77nkF4Nij7zzELhjpu8WI+L72xyvHevVBVCW0LiNum1hxvDJ6/Dymb31zmpGkd15HT3+
	/IV9F56DPOR/oM/oNNy9NRxZi7Z5SGXvQcvWpcD9WNd+deNjOwLSb/SiSNjQlnWVCwLY
	6yhHMCVtfIMuoNI+yCGOWULnFZ+jwbNMjasrmeciQeQjPJ7VG3SrSN8jQXQkq4mr6C8C
	qfNi8LhIG9pGYwfiClC4vlUoH+E5052OUQbJ5A/tP4sDj+gFzEHptnaUCs5HYeBwlhbS
	5COA==
X-Gm-Message-State: AD7BkJJSRFtFW0TCuaW4EIFcgZZ2m3BFwqkLhfi1sDbW0VYa+dBzvg5RlN0iwJ2HNVCy/572
X-Received: by 10.50.129.8 with SMTP id ns8mr23984587igb.95.1457517721840;
	Wed, 09 Mar 2016 02:02:01 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D19F.dip0.t-ipconnect.de. [93.232.209.159])
	by smtp.gmail.com with ESMTPSA id 78sm2838325iof.22.2016.03.09.02.02.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 02:02:01 -0800 (PST)
Message-ID: <1457517718.9847.28.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Mar 2016 11:01:58 +0100
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: systemd-serial-getty obsolete?
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
X-List-Received-Date: Wed, 09 Mar 2016 10:02:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

systemd-serialgetty.bb was introduced in OE-core together with systemd
1.96 and probably goes back even further (copied from meta-systemd). It
explicitly instantiates serial-getty@.service for serial ports specified
by SERIAL_CONSOLES.

I'm wondering whether that is still needed. systemd also has a generator
[1] that can activate serial-getty based on kernel boot parameters [2].

Is systemd-serialgetty.bb perhaps kept around because the "console"
parameters added to APPEND are (perhaps intentionally) not the same as
SERIAL_CONSOLES?

[1] https://www.freedesktop.org/software/systemd/man/systemd-getty-generator.html
[2] http://0pointer.de/blog/projects/serial-console.html

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




