Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C1AC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 21:21:19 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.29508.1736803084526273197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 13:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aFPxbgr6;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so4650945e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736803083; x=1737407883; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SudUKb/EpJ3kfzOLSs+2aDVcjoc6j68txeg02W2xjO8=;
        b=aFPxbgr6XmouATQ9EuBafTTVrdc/dLkEouGSPBY2u2RIKt/IooRDfxBA64VMNs/p3c
         ueY6SJPQ71tjD5z7suzxlqlMGazsD1S0vTNiyRT3MRRW4P0NpGygdkGyeakiR+vc5ZvU
         VQORdVTauyBfRrHiXQRvxipNQQQy/nqIhiafmSw63yccXIA/TapHtsatky5/x9YXsuuX
         0FiRyckhNv1bnjIuPY5F95XwlcyL6hScimYhQT0US721eKVvJ0zjZc718XYZigLbYvI7
         /ZUKUfTXuw/grYcUry/ZRBteOP5qRk6MD/vKWvXg8l05mRVAr/Eex8j473MdrWybUYNM
         07sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736803083; x=1737407883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SudUKb/EpJ3kfzOLSs+2aDVcjoc6j68txeg02W2xjO8=;
        b=SQutCIIElRLqjoRB+uEqCN70VlvpVKDE64vNpkU6z96oXmqsIqL3Ff0Gf2QONvBmgF
         LjB/CYUQNXHZ0MR84ieJI7+UdFUeKU2B3mcYFyZ1tb/0bVHv3oIx153dpN6N+yTrM9Us
         W5hryZDKynMGK5rDyTLAfrOZ0fbr3o8moGEI9Xx46FTXbQ5taQuLSbLNjijSzvBrwSwV
         zPEeCktgasok9YGelQYuRgg5Ynk7UzfO7DXFrv81yN/gkvsn9sgVUwy9JjciGv7XCRbk
         rmx5qDMzrJfW2KblehGtecCQWkjlfg350aGO8WiDZDY760tCiwulYX1mKd8+VQK9JnOs
         NrUg==
X-Gm-Message-State: AOJu0YwDEvSzF2295aCn9ZjUNcaMSdh3i0wDBxugUlPu0MVWgRj7UVUC
	H5+Cu+iJPQd1cxJS45BL9ZLqoO6qKJ8aILfPHu7eqq8uVh8h+dkI
X-Gm-Gg: ASbGncvpllP0gBcumz+rkLB+QwlQfBkFYXdXFo7DQ4yY1fHZ/FFOhLw4dmjQqDnbXPh
	BDVtyOG5Yx5DFIVwPP6yEPfaWTD/FSNbb5WTMAxEQGZD7yqroiwCePdh/HYjfB1mXOlp6A6wuB5
	F8q/lu3F+TzGpAhXfYGT7vGs2BYYhudQJ4Lnz1Oe/DjDJYqM8DdsPT0JogMStHCyZBe2x0MdAvA
	n04oDHyHibgQ0V9wRiT+UQe1+6S36rI+ykalTuuM/cxnR5n23gJu1GYORf7DzOQOr1qnYrYt8dl
	g4OJWFDdOp/SJuZ/jAmM9ParTkUV/GQk
X-Google-Smtp-Source: AGHT+IEBAq0tLcuDmiL9HY8d7OtA5d4TIuiJBujvwpAPHhXzYube1SJ8p0sAjPH80P99NDjuP/ozzQ==
X-Received: by 2002:a05:6512:33c4:b0:542:2ee3:29dd with SMTP id 2adb3069b0e04-542845b1ad7mr6232763e87.1.1736803082390;
        Mon, 13 Jan 2025 13:18:02 -0800 (PST)
Received: from [192.168.0.15] (89-64-20-185.dynamic.chello.pl. [89.64.20.185])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7c64sm16234471fa.88.2025.01.13.13.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 13:18:02 -0800 (PST)
Message-ID: <73914221-eb80-433e-a37a-37cf046014d5@gmail.com>
Date: Mon, 13 Jan 2025 22:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] systemd-systemctl: add support for --global flag
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250112143141.1300189-1-arturkow2000@gmail.com>
 <20250112143141.1300189-2-arturkow2000@gmail.com>
 <CAO5Uq5SJ8M3SBWB0WrkZZ8rE46J1XEMp45Ubtk-k4v5LgNALcg@mail.gmail.com>
From: "Artur Kowalski" <arturkow2000@gmail.com>
In-Reply-To: <CAO5Uq5SJ8M3SBWB0WrkZZ8rE46J1XEMp45Ubtk-k4v5LgNALcg@mail.gmail.com>
Content-Language: pl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 21:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209763


W dniu 12.01.2025 o 16:34, Alex Kiernan pisze:
> On Sun, Jan 12, 2025 at 2:40 PM Artur Kowalski via
> lists.openembedded.org <arturkow2000=gmail.com@lists.openembedded.org>
> wrote:
>> The flag is similar to --user flag as it causes systemctl to operate on
>> user units, but it performs operations globally for all users. This is
>> required to for user presets support.
> "to for"? Drop the "to"?
>
>> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
>> ---
>>   .../systemd/systemd-systemctl/systemctl       | 42 ++++++++++---------
>>   1 file changed, 23 insertions(+), 19 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> index 2229bc7b6d..9b8fe81459 100755
>> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
>> @@ -29,15 +29,15 @@ class SystemdFile():
>>
>>       _clearable_keys = ['WantedBy']
>>
>> -    def __init__(self, root, path, instance_unit_name):
>> +    def __init__(self, root, path, instance_unit_name, unit_type):
>>           self.sections = dict()
>>           self._parse(root, path)
>>           dirname = os.path.basename(path.name) + ".d"
>>           for location in locations:
>> -            files = (root / location / "system" / dirname).glob("*.conf")
>> +            files = (root / location / unit_type / dirname).glob("*.conf")
>>               if instance_unit_name:
>>                   inst_dirname = instance_unit_name + ".d"
>> -                files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
>> +                files = chain(files, (root / location / unit_type / inst_dirname).glob("*.conf"))
>>               for path2 in sorted(files):
>>                   self._parse(root, path2)
>>
>> @@ -182,21 +182,22 @@ class SystemdUnitNotFoundError(Exception):
>>
>>
>>   class SystemdUnit():
>> -    def __init__(self, root, unit):
>> +    def __init__(self, root, unit, unit_type):
>>           self.root = root
>>           self.unit = unit
>> +        self.unit_type = unit_type
>>           self.config = None
>>
>>       def _path_for_unit(self, unit):
>>           for location in locations:
>> -            path = self.root / location / "system" / unit
>> +            path = self.root / location / self.unit_type / unit
>>               if path.exists() or path.is_symlink():
>>                   return path
>>
>>           raise SystemdUnitNotFoundError(self.root, unit)
>>
>>       def _process_deps(self, config, service, location, prop, dirstem, instance):
>> -        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
>> +        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
>>
>>           target = ROOT / location.relative_to(self.root)
>>           try:
>> @@ -229,7 +230,7 @@ class SystemdUnit():
>>               # ignore aliases
>>               return
>>
>> -        config = SystemdFile(self.root, path, instance_unit_name)
>> +        config = SystemdFile(self.root, path, instance_unit_name, self.unit_type)
>>           if instance == "":
>>               try:
>>                   default_instance = config.get('Install', 'DefaultInstance')[0]
>> @@ -250,14 +251,14 @@ class SystemdUnit():
>>                   try:
>>                        units_enabled.append(unit)
>>                        if also not in units_enabled:
>> -                        SystemdUnit(self.root, also).enable(units_enabled)
>> +                        SystemdUnit(self.root, also, self.unit_type).enable(units_enabled)
>>                   except SystemdUnitNotFoundError as e:
>>                       sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
>>
>>           except KeyError:
>>               pass
>>
>> -        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
>> +        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
>>           target = ROOT / path.relative_to(self.root)
>>           try:
>>               for dest in config.get('Install', 'Alias'):
>> @@ -268,15 +269,15 @@ class SystemdUnit():
>>               pass
>>
>>       def mask(self):
>> -        systemdir = self.root / SYSCONFDIR / "systemd" / "system"
>> +        systemdir = self.root / SYSCONFDIR / "systemd" / self.unit_type
>>           add_link(systemdir / self.unit, "/dev/null")
>>
>>
>> -def collect_services(root):
>> +def collect_services(root, unit_type):
>>       """Collect list of service files"""
>>       services = set()
>>       for location in locations:
>> -        paths = (root / location / "system").glob("*")
>> +        paths = (root / location / unit_type).glob("*")
>>           for path in paths:
>>               if path.is_dir():
>>                   continue
>> @@ -285,16 +286,16 @@ def collect_services(root):
>>       return services
>>
>>
>> -def preset_all(root):
>> -    presets = Presets('system-preset', root)
>> -    services = collect_services(root)
>> +def preset_all(root, unit_type):
>> +    presets = Presets('{}-preset'.format(unit_type), root)
>> +    services = collect_services(root, unit_type)
>>
>>       for service in services:
>>           state = presets.state(service)
>>
>>           if state == "enable" or state is None:
>>               try:
>> -                SystemdUnit(root, service).enable()
>> +                SystemdUnit(root, service, unit_type).enable()
>>               except SystemdUnitNotFoundError:
>>                   sys.exit("Error: Systemctl preset_all issue in %s" % service)
>>
>> @@ -320,6 +321,7 @@ def main():
>>       parser.add_argument('--preset-mode',
>>                           choices=['full', 'enable-only', 'disable-only'],
>>                           default='full')
>> +    parser.add_argument('--global', dest="glob", action="store_true", default=False)
>>
> I guess `glob` because `global` is a keyword? But yuck... makes me
> think of https://docs.python.org/3/library/glob.html

Yes, that's the reason. Would using `global_` be okay? I choose 
suffixing instead of prefixing as underscore prefix has special meaning 
for private fields in Python so I guess that also wouldn't be best fit.

>
>>       args = parser.parse_args()
>>
>> @@ -336,16 +338,18 @@ def main():
>>           parser.print_help()
>>           return 0
>>
>> +    unit_type = "user" if args.glob else "system"
>> +
>>       if command == "mask":
>>           for service in args.service:
>>               try:
>> -                SystemdUnit(root, service).mask()
>> +                SystemdUnit(root, service, unit_type).mask()
>>               except SystemdUnitNotFoundError as e:
>>                   sys.exit("Error: Systemctl main mask issue in %s (%s)" % (service, e.unit))
>>       elif command == "enable":
>>           for service in args.service:
>>               try:
>> -                SystemdUnit(root, service).enable()
>> +                SystemdUnit(root, service, unit_type).enable()
>>               except SystemdUnitNotFoundError as e:
>>                   sys.exit("Error: Systemctl main enable issue in %s (%s)" % (service, e.unit))
>>       elif command == "preset-all":
>> @@ -353,7 +357,7 @@ def main():
>>               sys.exit("Too many arguments.")
>>           if args.preset_mode != "enable-only":
>>               sys.exit("Only enable-only is supported as preset-mode.")
>> -        preset_all(root)
>> +        preset_all(root, unit_type)
>>       else:
>>           raise RuntimeError()
>>
>> --
>> 2.47.0
>>
>>
>> 
>>
>
> --
> Alex Kiernan

